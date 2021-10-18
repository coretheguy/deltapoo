function is_english() {
    return ((!variable_global_exists("lang")) || global.lang == "en");
}

function langopt(eng, ja) {
    return (global.lang == "ja" ? argument1 : argument0);
}

