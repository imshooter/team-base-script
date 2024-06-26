/**
 * # Events
 */

forward OnPlayerEnterDominatableZone(playerid, zoneid);
forward OnPlayerLeaveDominatableZone(playerid, zoneid);

/**
 * # Header
 */

#if !defined DOMIN_ZONE_STREAMER_IDENTIFIER
    #define DOMIN_ZONE_STREAMER_IDENTIFIER (0)
#endif

static enum E_ZONE_AREA_DATA {
    MapZone:E_ZONE_AREA_MAP_ZONE_ID,

    Float:E_ZONE_AREA_MIN_X,
    Float:E_ZONE_AREA_MIN_Y,

    Float:E_ZONE_AREA_MAX_X,
    Float:E_ZONE_AREA_MAX_Y
};

static stock const
    gZoneAreaData[][E_ZONE_AREA_DATA] =
{
    // LV

    {ZONE_BATTERY_POINT, -2741.070068, 1268.410034, -2533.040039, 1490.469970},
    {ZONE_JUNIPER_HOLLOW, -2593.439941, -222.589004, -2411.219970, 54.722000},
    {ZONE_JUNIPER_HOLLOW, -2533.040039, 968.369018, -2274.169921, 1358.900024},
    {ZONE_ESPLANADE_NORTH, -2533.040039, 1358.900024, -1996.660034, 1501.209960},
    {ZONE_ESPLANADE_NORTH, -1996.660034, 1358.900024, -1524.239990, 1592.510009},
    {ZONE_ESPLANADE_NORTH, -1982.319946, 1274.260009, -1524.239990, 1358.900024},
    {ZONE_CALTON_HEIGHTS, -2274.169921, 744.169982, -1982.319946, 1358.900024},
    {ZONE_JUNIPER_HILL, -2533.040039, 578.395996, -2274.169921, 968.369018},
    {ZONE_CHINATOWN, -2274.169921, 578.395996, -2078.669921, 744.169982},
    {ZONE_KINGS, -2411.219970, 265.243011, -1993.280029, 373.539001},
    {ZONE_KINGS, -2329.310058, 458.411010, -1993.280029, 578.395996},
    {ZONE_KINGS, -2253.540039, 373.539001, -1993.280029, 458.411010},
    {ZONE_GARCIA, -2411.219970, -222.589004, -2173.040039, 265.243011},
    {ZONE_DOHERTY, -2173.040039, -222.589004, -1794.920043, 265.243011},
    {ZONE_DOWNTOWN, -1993.280029, 265.243011, -1794.920043, 578.395996},
    {ZONE_EASTER_BASIN, -1794.920043, -50.096298, -1499.890014, 249.904006},
    {ZONE_EASTER_BASIN, -1794.920043, 249.904006, -1242.979980, 578.395996},
    {ZONE_QUEENS, -2593.439941, 54.722000, -2411.219970, 458.411010},
    {ZONE_QUEENS, -2533.040039, 458.411010, -2329.310058, 578.395996},
    {ZONE_QUEENS, -2411.219970, 373.539001, -2253.540039, 458.411010},
    {ZONE_THE_STRIP, 2027.400024, 863.229003, 2087.389892, 1703.229980},

    // LS

    {ZONE_EL_CORONA, 1692.619995, -2179.250000, 1812.619995, -1842.270019},
    {ZONE_EL_CORONA, 1812.619995, -2179.250000, 1970.619995, -1852.869995},
    {ZONE_WILLOWFIELD, 1970.619995, -2179.250000, 2089.000000, -1852.869995},
    {ZONE_WILLOWFIELD, 2089.000000, -2235.840087, 2201.820068, -1989.900024},
    {ZONE_WILLOWFIELD, 2089.000000, -1989.900024, 2324.000000, -1852.869995},
    {ZONE_WILLOWFIELD, 2201.820068, -2095.000000, 2324.000000, -1989.900024},
    {ZONE_WILLOWFIELD, 2324.000000, -2059.229980, 2541.699951, -1852.869995},
    {ZONE_OCEAN_DOCKS, 2089.000000, -2394.330078, 2201.820068, -2235.840087},
    {ZONE_OCEAN_DOCKS, 2201.820068, -2730.879882, 2324.000000, -2418.330078},
    {ZONE_OCEAN_DOCKS, 2201.820068, -2418.330078, 2324.000000, -2095.000000},
    {ZONE_OCEAN_DOCKS, 2324.000000, -2145.100097, 2703.580078, -2059.229980},
    {ZONE_OCEAN_DOCKS, 2324.000000, -2302.330078, 2703.580078, -2145.100097},
    {ZONE_OCEAN_DOCKS, 2373.770019, -2697.090087, 2809.219970, -2330.459960},
    {ZONE_MARINA, 647.711975, -1577.589965, 807.921997, -1416.250000},
    {ZONE_MARINA, 647.711975, -1804.209960, 851.448974, -1577.589965},
    {ZONE_MARINA, 807.921997, -1577.589965, 926.921997, -1416.250000},
    {ZONE_VERONA_BEACH, 647.711975, -2173.290039, 930.221008, -1804.209960},
    {ZONE_VERONA_BEACH, 851.448974, -1804.209960, 1046.150024, -1577.589965},
    {ZONE_VERONA_BEACH, 930.221008, -2006.780029, 1073.219970, -1804.209960},
    {ZONE_VERONA_BEACH, 1046.150024, -1722.260009, 1161.520019, -1577.589965},
    {ZONE_VERONA_BEACH, 1161.520019, -1722.260009, 1323.900024, -1577.589965},
    {ZONE_LITTLE_MEXICO, 1701.900024, -1842.270019, 1812.619995, -1722.260009},
    {ZONE_LITTLE_MEXICO, 1758.900024, -1722.260009, 1812.619995, -1577.589965},
    {ZONE_IDLEWOOD, 1812.619995, -1602.310058, 2124.659912, -1449.670043},
    {ZONE_IDLEWOOD, 1812.619995, -1742.310058, 1951.660034, -1602.310058},
    {ZONE_IDLEWOOD, 1812.619995, -1852.869995, 1971.660034, -1742.310058},
    {ZONE_IDLEWOOD, 1951.660034, -1742.310058, 2124.659912, -1602.310058},
    {ZONE_IDLEWOOD, 1971.660034, -1852.869995, 2222.560058, -1742.310058},
    {ZONE_IDLEWOOD, 2124.659912, -1742.310058, 2222.560058, -1494.030029},
    {ZONE_GLEN_PARK, 1812.619995, -1350.719970, 2056.860107, -1100.819946},
    {ZONE_GLEN_PARK, 1812.619995, -1449.670043, 1996.910034, -1350.719970},
    {ZONE_JEFFERSON, 1996.910034, -1449.670043, 2056.860107, -1350.719970},
    {ZONE_JEFFERSON, 2056.860107, -1372.040039, 2281.449951, -1210.739990},
    {ZONE_JEFFERSON, 2056.860107, -1210.739990, 2185.330078, -1126.319946},
    {ZONE_JEFFERSON, 2056.860107, -1449.670043, 2266.209960, -1372.040039},
    {ZONE_JEFFERSON, 2124.659912, -1494.030029, 2266.209960, -1449.670043},
    {ZONE_JEFFERSON, 2185.330078, -1210.739990, 2281.449951, -1154.589965},
    {ZONE_LAS_COLINAS, 1994.329956, -1100.819946, 2056.860107, -920.815002},
    {ZONE_LAS_COLINAS, 2056.860107, -1126.319946, 2126.860107, -920.815002},
    {ZONE_LAS_COLINAS, 2126.860107, -1126.319946, 2185.330078, -934.489013},
    {ZONE_LAS_COLINAS, 2185.330078, -1154.589965, 2281.449951, -934.489013},
    {ZONE_LAS_COLINAS, 2281.449951, -1135.040039, 2632.739990, -945.034973},
    {ZONE_LAS_COLINAS, 2632.739990, -1135.040039, 2747.739990, -945.034973},
    {ZONE_LAS_COLINAS, 2747.739990, -1120.040039, 2959.350097, -945.034973},
    {ZONE_GANTON, 2222.560058, -1722.329956, 2632.830078, -1628.530029},
    {ZONE_GANTON, 2222.560058, -1852.869995, 2632.830078, -1722.329956},
    {ZONE_EAST_BEACH, 2632.830078, -1852.869995, 2959.350097, -1668.130004},
    {ZONE_EAST_BEACH, 2632.830078, -1668.130004, 2747.739990, -1393.420043},
    {ZONE_EAST_BEACH, 2747.739990, -1498.619995, 2959.350097, -1120.040039},
    {ZONE_EAST_BEACH, 2747.739990, -1668.130004, 2959.350097, -1498.619995},
    {ZONE_EAST_LOS_SANTOS, 2222.560058, -1628.530029, 2421.030029, -1494.030029},
    {ZONE_EAST_LOS_SANTOS, 2266.260009, -1494.030029, 2381.679931, -1372.040039},
    {ZONE_EAST_LOS_SANTOS, 2281.449951, -1372.040039, 2381.679931, -1135.040039},
    {ZONE_EAST_LOS_SANTOS, 2381.679931, -1454.349975, 2462.129882, -1135.040039},
    {ZONE_EAST_LOS_SANTOS, 2381.679931, -1494.030029, 2421.030029, -1454.349975},
    {ZONE_EAST_LOS_SANTOS, 2421.030029, -1628.530029, 2632.830078, -1454.349975},
    {ZONE_EAST_LOS_SANTOS, 2462.129882, -1454.349975, 2581.729980, -1135.040039},
    {ZONE_LOS_FLORES, 2581.729980, -1454.349975, 2632.830078, -1393.420043},
    {ZONE_LOS_FLORES, 2581.729980, -1393.420043, 2747.739990, -1135.040039},
    {ZONE_MARKET, 787.460998, -1416.250000, 1072.660034, -1310.209960},
    {ZONE_MARKET, 926.921997, -1577.589965, 1370.849975, -1416.250000},
    {ZONE_MARKET, 952.663024, -1310.209960, 1072.660034, -1130.849975},
    {ZONE_VINEWOOD, 647.557006, -1227.280029, 787.460998, -1118.280029},
    {ZONE_VINEWOOD, 647.711975, -1416.250000, 787.460998, -1227.280029},
    {ZONE_VINEWOOD, 787.460998, -1310.209960, 952.663024, -1130.839965},
    {ZONE_VINEWOOD, 787.460998, -1130.839965, 952.604003, -954.661987},
    {ZONE_TEMPLE, 952.663024, -1130.839965, 1096.469970, -937.184020},
    {ZONE_TEMPLE, 1096.469970, -1130.839965, 1252.329956, -1026.329956},
    {ZONE_TEMPLE, 1096.469970, -1026.329956, 1252.329956, -910.169982},
    {ZONE_TEMPLE, 1252.329956, -1130.849975, 1378.329956, -1026.329956},
    {ZONE_TEMPLE, 1252.329956, -1026.329956, 1391.050048, -926.999023},
    {ZONE_SANTA_MARIA_BEACH, 72.648101, -2173.290039, 342.648010, -1684.650024},
    {ZONE_SANTA_MARIA_BEACH, 342.648010, -2173.290039, 647.711975, -1684.650024},
    {ZONE_PLAYA_DEL_SEVILLE, 2703.580078, -2126.899902, 2959.350097, -1852.869995},

    // LV

    {ZONE_THE_FOUR_DRAGONS_CASINO, 1817.390014, 863.231994, 2027.390014, 1083.229980},
    {ZONE_THE_PINK_SWAN, 1817.390014, 1083.229980, 2027.390014, 1283.229980},
    {ZONE_THE_HIGH_ROLLER, 1817.390014, 1283.229980, 2027.390014, 1469.229980},
    {ZONE_PIRATES_IN_MENS_PANTS, 1817.390014, 1469.229980, 2027.400024, 1703.229980},
    {ZONE_COMEALOT, 2087.389892, 943.234985, 2623.179931, 1203.229980},
    {ZONE_THE_CAMELS_TOE, 2087.389892, 1203.229980, 2640.399902, 1383.229980},
    {ZONE_ROYAL_CASINO, 2087.389892, 1383.229980, 2437.389892, 1543.229980},
    {ZONE_ROYAL_CASINO, 2137.399902, 1703.229980, 2437.389892, 1783.229980},
    {ZONE_CALIGULAS_PALACE, 2087.389892, 1543.229980, 2437.389892, 1703.229980},
    {ZONE_PILGRIM, 2437.389892, 1383.229980, 2624.399902, 1783.229980},
    {ZONE_STARFISH_CASINO, 2162.389892, 1883.229980, 2437.389892, 2012.180053},
    {ZONE_STARFISH_CASINO, 2437.389892, 1783.229980, 2685.159912, 2012.180053},
    {ZONE_OLD_VENTURAS_STRIP, 2162.389892, 2012.180053, 2685.159912, 2202.760009},
    {ZONE_REDSANDS_EAST, 1817.390014, 2011.829956, 2106.699951, 2202.760009},
    {ZONE_REDSANDS_EAST, 1817.390014, 2202.760009, 2011.939941, 2342.830078},
    {ZONE_REDSANDS_EAST, 1848.400024, 2342.830078, 2011.939941, 2478.489990},
    {ZONE_REDSANDS_WEST, 1236.630004, 1883.109985, 1777.390014, 2142.860107},
    {ZONE_REDSANDS_WEST, 1297.469970, 2142.860107, 1777.390014, 2243.229980},
    {ZONE_REDSANDS_WEST, 1377.390014, 2243.229980, 1704.589965, 2433.229980},
    {ZONE_REDSANDS_WEST, 1704.589965, 2243.229980, 1777.390014, 2342.830078},
    {ZONE_THE_CLOWNS_POCKET, 2162.389892, 1783.229980, 2437.389892, 1883.229980}
};

const
    MAX_DOMIN_ZONE_AREAS = (sizeof (gZoneAreaData))
;

static
    gZoneDominatableZoneAreaID[MAX_GANG_ZONES char]                   = { -1, ... },
    gDominatableZoneID[MAX_DOMIN_ZONE_AREAS]                          = { INVALID_GANG_ZONE, ... },
    STREAMER_TAG_AREA:gDominatableZoneDynAreaID[MAX_DOMIN_ZONE_AREAS] = { STREAMER_TAG_AREA:INVALID_STREAMER_ID, ... },
    Faction:gDominatableZoneFactionID[MAX_DOMIN_ZONE_AREAS char]      = { FACTION_NONE, ... },
    gDominatableZoneFactionSlotID[MAX_DOMIN_ZONE_AREAS char]          = { -1, ... },
    gFactionDominatedZones[MAX_FACTIONS][MAX_DOMIN_ZONE_AREAS]        = { { INVALID_GANG_ZONE, ... }, ... }
;

new
    Iterator:DominatedZone[MAX_FACTIONS]<MAX_DOMIN_ZONE_AREAS>,
    Iterator:DominatableZonePlayer[MAX_DOMIN_ZONE_AREAS]<MAX_PLAYERS>
;

/**
 * # Dominatable Zone Areas
 */

stock GetDominatableZoneID(index) {
    return gDominatableZoneID[index];
}

stock GetDominatableZoneAreaPos(index, &Float:minX, &Float:minY, &Float:maxX, &Float:maxY) {
    minX = gZoneAreaData[index][E_ZONE_AREA_MIN_X];
    minY = gZoneAreaData[index][E_ZONE_AREA_MIN_Y];
    maxX = gZoneAreaData[index][E_ZONE_AREA_MAX_X];
    maxY = gZoneAreaData[index][E_ZONE_AREA_MAX_Y];
}

stock GetDominatableZoneAtPoint(Float:x, Float:y, Float:z) {
    /**
     * This function will be used to get the zone by coordinates.
     * This function returns the zone ID (gang territory) that will be in the function's coordinates.
     */

    new
        STREAMER_TAG_AREA:arr[256],
        data[2]
    ;

    for (new i, size = GetDynamicAreasForPoint(x, y, z, arr); i < size; ++i) {
        Streamer_GetArrayData(STREAMER_TYPE_AREA, arr[i], E_STREAMER_EXTRA_ID, data);

        if (data[0] != DOMIN_ZONE_STREAMER_IDENTIFIER) {
            continue;
        }

        return gDominatableZoneID[data[1]];
    }

    return INVALID_GANG_ZONE;
}

/**
 * # Zone
 */

stock GetZoneFaction(zoneid, &Faction:factionid, &index = -1) {
    if (gZoneDominatableZoneAreaID{zoneid} == -1) {
        return;
    }

    new const
        index = gZoneDominatableZoneAreaID{zoneid}
    ;

    factionid = gDominatableZoneFactionID{index};
    index = gDominatableZoneFactionSlotID{index};
}

stock GetZonePlayerCount(zoneid) {
    if (!IsValidGangZone(zoneid)) {
        return 0;
    }

    if (gZoneDominatableZoneAreaID{zoneid} == -1) {
        return 0;
    }

    new const
        index = gZoneDominatableZoneAreaID{zoneid}
    ;

    return Iter_Count(DominatableZonePlayer[index]);
}

/**
 * # Faction
 */

stock AddZoneToFaction(Faction:factionid, zoneid) {
    if (gZoneDominatableZoneAreaID{zoneid} == -1) {
        return;
    }

    new const
        alloc = Iter_Alloc(DominatedZone[factionid])
    ;

    if (alloc == cellmin) {
        return;
    }

    new const
        index = gZoneDominatableZoneAreaID{zoneid}
    ;

    gDominatableZoneFactionID{index} = factionid;
    gDominatableZoneFactionSlotID{index} = index;
    gFactionDominatedZones[factionid][alloc] = zoneid;
}

stock RemoveZoneFromFaction(Faction:factionid, zoneid) {
    if (gZoneDominatableZoneAreaID{zoneid} == -1) {
        return;
    }

    new const
        index = gZoneDominatableZoneAreaID{zoneid}
    ;

    if (gDominatableZoneFactionSlotID{index} == -1) {
        return;
    }

    new const
        alloc = gDominatableZoneFactionSlotID{index}
    ;

    gDominatableZoneFactionID{index} = FACTION_NONE;
    gDominatableZoneFactionSlotID{index} = -1;
    gFactionDominatedZones[factionid][alloc] = INVALID_GANG_ZONE;
    
    Iter_Remove(DominatedZone[factionid], alloc);
}

stock GetFactionDominatedZones(Faction:factionid, dest[MAX_DOMIN_ZONE_AREAS] = { INVALID_GANG_ZONE, ... }, &count = 0) {
    count = 0;

    foreach (new i : DominatedZone[factionid]) {
        dest[count++] = gFactionDominatedZones[factionid][i];
    }
}

stock GetPlayerDominatableZoneID(playerid) {
    new
        Float:x,
        Float:y,
        Float:z
    ;

    if (!GetPlayerPos(playerid, x, y, z)) {
        return INVALID_GANG_ZONE;
    }

    return GetDominatableZoneAtPoint(x, y, z);
}

/**
 * # Hooks
 */

hook OnGameModeInit() {
    new
        data[2]
    ;

    for (new i; i != MAX_DOMIN_ZONE_AREAS; ++i) {
        gDominatableZoneID[i] = GangZoneCreate(gZoneAreaData[i][E_ZONE_AREA_MIN_X], gZoneAreaData[i][E_ZONE_AREA_MIN_Y], gZoneAreaData[i][E_ZONE_AREA_MAX_X], gZoneAreaData[i][E_ZONE_AREA_MAX_Y]);
        gDominatableZoneDynAreaID[i] = CreateDynamicRectangle(gZoneAreaData[i][E_ZONE_AREA_MIN_X], gZoneAreaData[i][E_ZONE_AREA_MIN_Y], gZoneAreaData[i][E_ZONE_AREA_MAX_X], gZoneAreaData[i][E_ZONE_AREA_MAX_Y]);
        
        gZoneDominatableZoneAreaID{gDominatableZoneID[i]} = i;

        data[0] = DOMIN_ZONE_STREAMER_IDENTIFIER;
        data[1] = i;

        Streamer_SetArrayData(STREAMER_TYPE_AREA, gDominatableZoneDynAreaID[i], E_STREAMER_EXTRA_ID, data);
    }
    
    return 1;
}

hook OnPlayerSpawn(playerid) {
    new
        zoneid, index, Faction:factionid
    ;

    for (new i; i != MAX_DOMIN_ZONE_AREAS; ++i) {
        if (gDominatableZoneID[i] == INVALID_GANG_ZONE) {
            break;
        }

        zoneid    = gDominatableZoneID[i];
        index     = gZoneDominatableZoneAreaID{zoneid},
        factionid = gDominatableZoneFactionID{index};

        GangZoneShowForPlayer(playerid, zoneid, GetFactionColor(factionid, 0x80));
    }

    return 1;
}

hook OnPlayerEnterDynamicArea(playerid, STREAMER_TAG_AREA:areaid) {
    new
        data[2]
    ;

    Streamer_GetArrayData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID, data);

    if (data[0] == DOMIN_ZONE_STREAMER_IDENTIFIER) {
        new const
            index = data[1]
        ;

        Iter_Add(DominatableZonePlayer[index], playerid);

        CallLocalFunction("OnPlayerEnterDominatableZone", "ii", playerid, gDominatableZoneID[index]);
    }
    
    return 1;
}

hook OnPlayerLeaveDynamicArea(playerid, STREAMER_TAG_AREA:areaid) {
    new
        data[2]
    ;

    Streamer_GetArrayData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID, data);

    if (data[0] == DOMIN_ZONE_STREAMER_IDENTIFIER) {
        new const
            index = data[1]
        ;

        Iter_Add(DominatableZonePlayer[index], playerid);

        CallLocalFunction("OnPlayerLeaveDominatableZone", "ii", playerid, gDominatableZoneID[index]);
    }
    
    return 1;
}
