package main

import (
	"encoding/json"
	"net/http"
	"strconv"
	"strings"
)

// Paginated response wrapper
type PaginatedResponse struct {
	Data       interface{} `json:"data"`
	Count      int         `json:"count"`
	Total      int         `json:"total"`
	Page       int         `json:"page"`
	PerPage    int         `json:"per_page"`
	TotalPages int         `json:"total_pages"`
	HasMore    bool        `json:"has_more"`
}

func getPagination(r *http.Request) (page, perPage int) {
	page = 1
	perPage = 20
	
	if p := r.URL.Query().Get("page"); p != "" {
		if v, err := strconv.Atoi(p); err == nil && v > 0 {
			page = v
		}
	}
	if pp := r.URL.Query().Get("per_page"); pp != "" {
		if v, err := strconv.Atoi(pp); err == nil && v > 0 && v <= 100 {
			perPage = v
		}
	}
	return
}

// handleMonsterSearch godoc
// @Summary Search monsters
// @Description Search and filter monsters with pagination
// @Tags SRD
// @Produce json
// @Param type query string false "Monster type (e.g., dragon, undead, humanoid)"
// @Param size query string false "Size (tiny, small, medium, large, huge, gargantuan)"
// @Param cr query string false "Challenge rating (e.g., 1, 1/4, 5)"
// @Param hp_min query int false "Minimum HP"
// @Param hp_max query int false "Maximum HP"
// @Param name query string false "Name search (partial match)"
// @Param sort query string false "Sort field (hp, hp_desc, cr, name)"
// @Param page query int false "Page number" default(1)
// @Param per_page query int false "Results per page (max 100)" default(20)
// @Success 200 {object} PaginatedResponse "Paginated monster list"
// @Router /srd/monsters/search [get]
func handleMonsterSearch(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	
	page, perPage := getPagination(r)
	offset := (page - 1) * perPage
	
	// Build query
	query := "SELECT slug, name, size, type, ac, hp, hit_dice, speed, str, dex, con, intl, wis, cha, cr, xp, actions FROM monsters WHERE 1=1"
	countQuery := "SELECT COUNT(*) FROM monsters WHERE 1=1"
	args := []interface{}{}
	argNum := 1
	
	// Type filter (e.g., dragon, undead, humanoid)
	if t := r.URL.Query().Get("type"); t != "" {
		query += " AND LOWER(type) LIKE $" + strconv.Itoa(argNum)
		countQuery += " AND LOWER(type) LIKE $" + strconv.Itoa(argNum)
		args = append(args, "%"+strings.ToLower(t)+"%")
		argNum++
	}
	
	// Size filter
	if s := r.URL.Query().Get("size"); s != "" {
		query += " AND LOWER(size) = $" + strconv.Itoa(argNum)
		countQuery += " AND LOWER(size) = $" + strconv.Itoa(argNum)
		args = append(args, strings.ToLower(s))
		argNum++
	}
	
	// HP range
	if hpMin := r.URL.Query().Get("hp_min"); hpMin != "" {
		if v, err := strconv.Atoi(hpMin); err == nil {
			query += " AND hp >= $" + strconv.Itoa(argNum)
			countQuery += " AND hp >= $" + strconv.Itoa(argNum)
			args = append(args, v)
			argNum++
		}
	}
	if hpMax := r.URL.Query().Get("hp_max"); hpMax != "" {
		if v, err := strconv.Atoi(hpMax); err == nil {
			query += " AND hp <= $" + strconv.Itoa(argNum)
			countQuery += " AND hp <= $" + strconv.Itoa(argNum)
			args = append(args, v)
			argNum++
		}
	}
	
	// CR filter (challenge rating as string because of fractions like "1/4")
	if cr := r.URL.Query().Get("cr"); cr != "" {
		query += " AND cr = $" + strconv.Itoa(argNum)
		countQuery += " AND cr = $" + strconv.Itoa(argNum)
		args = append(args, cr)
		argNum++
	}
	
	// Name search
	if name := r.URL.Query().Get("name"); name != "" {
		query += " AND LOWER(name) LIKE $" + strconv.Itoa(argNum)
		countQuery += " AND LOWER(name) LIKE $" + strconv.Itoa(argNum)
		args = append(args, "%"+strings.ToLower(name)+"%")
		argNum++
	}
	
	// Get total count
	var total int
	db.QueryRow(countQuery, args...).Scan(&total)
	
	// Sort
	sort := r.URL.Query().Get("sort")
	switch sort {
	case "hp":
		query += " ORDER BY hp"
	case "hp_desc":
		query += " ORDER BY hp DESC"
	case "cr":
		query += " ORDER BY cr"
	case "name":
		query += " ORDER BY name"
	default:
		query += " ORDER BY name"
	}
	
	// Pagination
	query += " LIMIT $" + strconv.Itoa(argNum) + " OFFSET $" + strconv.Itoa(argNum+1)
	args = append(args, perPage, offset)
	
	rows, err := db.Query(query, args...)
	if err != nil {
		json.NewEncoder(w).Encode(map[string]string{"error": err.Error()})
		return
	}
	defer rows.Close()
	
	monsters := []map[string]interface{}{}
	for rows.Next() {
		var slug, name, size, mtype, hitDice, cr string
		var ac, hp, speed, str, dex, con, intl, wis, cha, xp int
		var actionsJSON []byte
		rows.Scan(&slug, &name, &size, &mtype, &ac, &hp, &hitDice, &speed, &str, &dex, &con, &intl, &wis, &cha, &cr, &xp, &actionsJSON)
		
		var actions []interface{}
		json.Unmarshal(actionsJSON, &actions)
		
		monsters = append(monsters, map[string]interface{}{
			"slug": slug, "name": name, "size": size, "type": mtype,
			"ac": ac, "hp": hp, "hit_dice": hitDice, "speed": speed,
			"str": str, "dex": dex, "con": con, "int": intl, "wis": wis, "cha": cha,
			"cr": cr, "xp": xp, "actions": actions,
		})
	}
	
	totalPages := (total + perPage - 1) / perPage
	
	json.NewEncoder(w).Encode(PaginatedResponse{
		Data:       monsters,
		Count:      len(monsters),
		Total:      total,
		Page:       page,
		PerPage:    perPage,
		TotalPages: totalPages,
		HasMore:    page < totalPages,
	})
}

// handleSpellSearch godoc
// @Summary Search spells
// @Description Search and filter spells with pagination
// @Tags SRD
// @Produce json
// @Param level query int false "Exact spell level (0-9)"
// @Param level_min query int false "Minimum spell level"
// @Param level_max query int false "Maximum spell level"
// @Param school query string false "School of magic (evocation, abjuration, etc.)"
// @Param damage_type query string false "Damage type (fire, cold, lightning, etc.)"
// @Param concentration query bool false "Requires concentration"
// @Param ritual query bool false "Can be cast as ritual"
// @Param class query string false "Available to class (wizard, cleric, etc.)"
// @Param name query string false "Name search (partial match)"
// @Param sort query string false "Sort field (level, level_desc, school)"
// @Param page query int false "Page number" default(1)
// @Param per_page query int false "Results per page (max 100)" default(20)
// @Success 200 {object} PaginatedResponse "Paginated spell list"
// @Router /srd/spells/search [get]
func handleSpellSearch(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	
	page, perPage := getPagination(r)
	offset := (page - 1) * perPage
	
	query := "SELECT slug, name, level, school, casting_time, range, components, duration, description, damage_dice, damage_type, saving_throw, healing FROM spells WHERE 1=1"
	countQuery := "SELECT COUNT(*) FROM spells WHERE 1=1"
	args := []interface{}{}
	argNum := 1
	
	// Level filter
	if lvl := r.URL.Query().Get("level"); lvl != "" {
		if v, err := strconv.Atoi(lvl); err == nil {
			query += " AND level = $" + strconv.Itoa(argNum)
			countQuery += " AND level = $" + strconv.Itoa(argNum)
			args = append(args, v)
			argNum++
		}
	}
	
	// Level range
	if lvlMin := r.URL.Query().Get("level_min"); lvlMin != "" {
		if v, err := strconv.Atoi(lvlMin); err == nil {
			query += " AND level >= $" + strconv.Itoa(argNum)
			countQuery += " AND level >= $" + strconv.Itoa(argNum)
			args = append(args, v)
			argNum++
		}
	}
	if lvlMax := r.URL.Query().Get("level_max"); lvlMax != "" {
		if v, err := strconv.Atoi(lvlMax); err == nil {
			query += " AND level <= $" + strconv.Itoa(argNum)
			countQuery += " AND level <= $" + strconv.Itoa(argNum)
			args = append(args, v)
			argNum++
		}
	}
	
	// School filter
	if school := r.URL.Query().Get("school"); school != "" {
		query += " AND LOWER(school) = $" + strconv.Itoa(argNum)
		countQuery += " AND LOWER(school) = $" + strconv.Itoa(argNum)
		args = append(args, strings.ToLower(school))
		argNum++
	}
	
	// Damage type filter
	if dt := r.URL.Query().Get("damage_type"); dt != "" {
		query += " AND LOWER(damage_type) = $" + strconv.Itoa(argNum)
		countQuery += " AND LOWER(damage_type) = $" + strconv.Itoa(argNum)
		args = append(args, strings.ToLower(dt))
		argNum++
	}
	
	// Concentration filter
	if conc := r.URL.Query().Get("concentration"); conc != "" {
		val := conc == "true"
		query += " AND concentration = $" + strconv.Itoa(argNum)
		countQuery += " AND concentration = $" + strconv.Itoa(argNum)
		args = append(args, val)
		argNum++
	}
	
	// Ritual filter
	if rit := r.URL.Query().Get("ritual"); rit != "" {
		val := rit == "true"
		query += " AND ritual = $" + strconv.Itoa(argNum)
		countQuery += " AND ritual = $" + strconv.Itoa(argNum)
		args = append(args, val)
		argNum++
	}
	
	// Name search
	if name := r.URL.Query().Get("name"); name != "" {
		query += " AND LOWER(name) LIKE $" + strconv.Itoa(argNum)
		countQuery += " AND LOWER(name) LIKE $" + strconv.Itoa(argNum)
		args = append(args, "%"+strings.ToLower(name)+"%")
		argNum++
	}
	
	// Class filter (spells available to a class)
	if class := r.URL.Query().Get("class"); class != "" {
		query += " AND classes @> $" + strconv.Itoa(argNum)
		countQuery += " AND classes @> $" + strconv.Itoa(argNum)
		args = append(args, `["`+strings.ToLower(class)+`"]`)
		argNum++
	}
	
	var total int
	db.QueryRow(countQuery, args...).Scan(&total)
	
	// Sort
	sort := r.URL.Query().Get("sort")
	switch sort {
	case "level":
		query += " ORDER BY level, name"
	case "level_desc":
		query += " ORDER BY level DESC, name"
	case "school":
		query += " ORDER BY school, name"
	default:
		query += " ORDER BY level, name"
	}
	
	query += " LIMIT $" + strconv.Itoa(argNum) + " OFFSET $" + strconv.Itoa(argNum+1)
	args = append(args, perPage, offset)
	
	rows, err := db.Query(query, args...)
	if err != nil {
		json.NewEncoder(w).Encode(map[string]string{"error": err.Error()})
		return
	}
	defer rows.Close()
	
	spells := []map[string]interface{}{}
	for rows.Next() {
		var slug, name, school, castTime, rng, components, duration, desc, damageDice, damageType, save, healing string
		var level int
		rows.Scan(&slug, &name, &level, &school, &castTime, &rng, &components, &duration, &desc, &damageDice, &damageType, &save, &healing)
		
		spells = append(spells, map[string]interface{}{
			"slug": slug, "name": name, "level": level, "school": school,
			"casting_time": castTime, "range": rng, "components": components, "duration": duration,
			"description": desc, "damage_dice": damageDice, "damage_type": damageType,
			"saving_throw": save, "healing": healing,
		})
	}
	
	totalPages := (total + perPage - 1) / perPage
	
	json.NewEncoder(w).Encode(PaginatedResponse{
		Data:       spells,
		Count:      len(spells),
		Total:      total,
		Page:       page,
		PerPage:    perPage,
		TotalPages: totalPages,
		HasMore:    page < totalPages,
	})
}

// handleWeaponSearch godoc
// @Summary Search weapons
// @Description Search and filter weapons with pagination
// @Tags SRD
// @Produce json
// @Param type query string false "Weapon type (simple, martial)"
// @Param range query string false "Weapon range (melee, ranged)"
// @Param damage_type query string false "Damage type (slashing, piercing, bludgeoning)"
// @Param name query string false "Name search (partial match)"
// @Param page query int false "Page number" default(1)
// @Param per_page query int false "Results per page (max 100)" default(20)
// @Success 200 {object} PaginatedResponse "Paginated weapon list"
// @Router /srd/weapons/search [get]
func handleWeaponSearch(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	
	page, perPage := getPagination(r)
	offset := (page - 1) * perPage
	
	query := "SELECT slug, name, type, weapon_range, damage, damage_type, weight, properties FROM weapons WHERE 1=1"
	countQuery := "SELECT COUNT(*) FROM weapons WHERE 1=1"
	args := []interface{}{}
	argNum := 1
	
	if t := r.URL.Query().Get("type"); t != "" {
		query += " AND LOWER(type) = $" + strconv.Itoa(argNum)
		countQuery += " AND LOWER(type) = $" + strconv.Itoa(argNum)
		args = append(args, strings.ToLower(t))
		argNum++
	}
	
	if rng := r.URL.Query().Get("range"); rng != "" {
		query += " AND LOWER(weapon_range) = $" + strconv.Itoa(argNum)
		countQuery += " AND LOWER(weapon_range) = $" + strconv.Itoa(argNum)
		args = append(args, strings.ToLower(rng))
		argNum++
	}
	
	if dt := r.URL.Query().Get("damage_type"); dt != "" {
		query += " AND LOWER(damage_type) = $" + strconv.Itoa(argNum)
		countQuery += " AND LOWER(damage_type) = $" + strconv.Itoa(argNum)
		args = append(args, strings.ToLower(dt))
		argNum++
	}
	
	if name := r.URL.Query().Get("name"); name != "" {
		query += " AND LOWER(name) LIKE $" + strconv.Itoa(argNum)
		countQuery += " AND LOWER(name) LIKE $" + strconv.Itoa(argNum)
		args = append(args, "%"+strings.ToLower(name)+"%")
		argNum++
	}
	
	var total int
	db.QueryRow(countQuery, args...).Scan(&total)
	
	query += " ORDER BY name LIMIT $" + strconv.Itoa(argNum) + " OFFSET $" + strconv.Itoa(argNum+1)
	args = append(args, perPage, offset)
	
	rows, err := db.Query(query, args...)
	if err != nil {
		json.NewEncoder(w).Encode(map[string]string{"error": err.Error()})
		return
	}
	defer rows.Close()
	
	weapons := []map[string]interface{}{}
	for rows.Next() {
		var slug, name, wtype, wrange, damage, damageType, props string
		var weight float64
		rows.Scan(&slug, &name, &wtype, &wrange, &damage, &damageType, &weight, &props)
		weapons = append(weapons, map[string]interface{}{
			"slug": slug, "name": name, "type": wtype, "range": wrange,
			"damage": damage, "damage_type": damageType, "weight": weight, "properties": props,
		})
	}
	
	totalPages := (total + perPage - 1) / perPage
	
	json.NewEncoder(w).Encode(PaginatedResponse{
		Data:       weapons,
		Count:      len(weapons),
		Total:      total,
		Page:       page,
		PerPage:    perPage,
		TotalPages: totalPages,
		HasMore:    page < totalPages,
	})
}
