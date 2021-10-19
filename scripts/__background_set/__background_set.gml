function __background_set(arg0, arg1, arg2) {
    var __prop = argument0
    var __bind = argument1
    var __val = argument2
    var __backinfo = __background_get_element(__bind)
    __background_set_internal(__prop, __bind, __val, __backinfo)
    var __res = __background_get_internal(__prop, __bind, __backinfo)
    return __res;
}

function __background_set_internal(a0, a1, a2, a3) {
    var __prop = argument0
    var __bind = argument1
    var __val = argument2
    var __backinfo = argument3
    if (__backinfo[0] == -1)
        return -1;
    var __backid = __backinfo[0]
    var __layerid = __backinfo[1]
    var __isfore = __backinfo[2]
    if (__prop == (1))
    {
        if (round(__val) != round(__isfore))
        {
            var __visible = layer_get_visible(__layerid)
            var __index = layer_background_get_sprite(__backid)
            var __htiled = layer_background_get_htiled(__backid)
            var __vtiled = layer_background_get_vtiled(__backid)
            var __stretch = layer_background_get_stretch(__backid)
            var __blend = layer_background_get_blend(__backid)
            var __alpha = layer_background_get_alpha(__backid)
            var __xscale = layer_background_get_xscale(__backid)
            var __yscale = layer_background_get_yscale(__backid)
            var __x = layer_get_x(__layerid)
            var __y = layer_get_y(__layerid)
            var __hspeed = layer_get_hspeed(__layerid)
            var __vspeed = layer_get_vspeed(__layerid)
            __background_set_element(__bind, __visible, __val, __index, __x, __y, __htiled, __vtiled, __xscale, __yscale, __stretch, __hspeed, __vspeed, __blend, __alpha)
        }
    }
    else
    {
        switch __prop
        {
            case (0):
                layer_set_visible(__layerid, __val)
                layer_background_visible(__backid, __val)
                break
            case (2):
                layer_background_change(__backid, __val)
                if sprite_exists(__val)
                {
                    layer_background_blend(__backid, c_white)
                    layer_background_alpha(__backid, 1)
                }
                break
            case (3):
                layer_x(__layerid, __val)
                break
            case (4):
                layer_y(__layerid, __val)
                break
            case (7):
                layer_background_htiled(__backid, __val)
                break
            case (8):
                layer_background_vtiled(__backid, __val)
                break
            case (9):
                layer_background_xscale(__backid, __val)
                break
            case (10):
                layer_background_yscale(__backid, __val)
                break
            case (11):
                layer_hspeed(__layerid, __val)
                break
            case (12):
                layer_vspeed(__layerid, __val)
                break
            case (13):
                layer_background_blend(__backid, __val)
                break
            case (14):
                layer_background_alpha(__backid, __val)
                break
            default:
                break
        }

    }
    return -1;
}

function __background_set_element() {
    var __bind = argument0
    var __vis = argument1
    var __fore = argument2
    var __back = argument3
    var __x = argument4
    var __y = argument5
    var __htiled = argument6
    var __vtiled = argument7
    var __xscale = argument8
    var __yscale = argument9
    var __stretch = argument10
    var __hspeed = argument11
    var __vspeed = argument12
    var __blend = argument13
    var __alpha = argument14
    var __nearestdepth = 1000000000
    var __farthestdepth = -1000000000
    var __depthinc = 100
    __result[0] = -1
    __result[1] = -1
    var __fgstring = "Compatibility_Foreground_"
    var __bgstring = "Compatibility_Background_"
    var __colstring = "Compatibility_Colour"
    var __fglen = string_length(__fgstring)
    var __bglen = string_length(__bgstring)
    var __layerlist = layer_get_all()
    var __layerlistlength = array_length_1d(__layerlist)
    var __collayer = -1
    for (var __i = 0; __i < 8; __i++)
    {
        __slots[__i] = -1
        __isforeground[__i] = 0
    }
    for (__i = 0; __i < __layerlistlength; __i++)
    {
        var __layername = layer_get_name(__layerlist[__i])
        if (string_pos(__fgstring, __layername) > 0)
        {
            var __slotchr = string_char_at(__layername, (__fglen + 1))
            if (__slotchr == "")
            {
            }
            else
            {
                var __slot = real(__slotchr)
                __slots[__slot] = __layerlist[__i]
                __isforeground[__slot] = 1
            }
        }
        else if (string_pos(__bgstring, __layername) > 0)
        {
            __slotchr = string_char_at(__layername, (__bglen + 1))
            if (__slotchr == "")
            {
            }
            else
            {
                __slot = real(__slotchr)
                __slots[__slot] = __layerlist[__i]
                __isforeground[__slot] = 0
            }
        }
        else if (string_pos(__colstring, __layername) > 0)
        {
            __collayer = __layerlist[__i]
            layer_depth(__layerlist[__i], __farthestdepth)
        }
        else
        {
            var __currdepth = layer_get_depth(__layerlist[__i])
            if (__currdepth < __nearestdepth)
                __nearestdepth = __currdepth
            if (__currdepth > __farthestdepth)
                __farthestdepth = __currdepth
        }
    }
    __farthestdepth += (__depthinc + 1000)
    __nearestdepth -= __depthinc
    __farthestdepth = max(__farthestdepth, 2147483600)
    __nearestdepth = min(__nearestdepth, -2147482000)
    for (__i = 0; __i < 8; __i++)
    {
        if (__slots[__i] != -1)
        {
            var __depth = 0
            if (__isforeground[__i] == 1)
                __depth = (__nearestdepth - (__i * __depthinc))
            else
                __depth = ((__farthestdepth - __depthinc) - (__slot * __depthinc))
            layer_depth(__slots[__i], __depth)
        }
    }
    if (__collayer != -1)
        layer_depth(__collayer, __farthestdepth)
    if (__bind == -1)
    {
        __layername = __colstring
        var __layerdepth = __farthestdepth
    }
    else if (__fore == 1)
    {
        __layername = (__fgstring + string(__bind))
        __layerdepth = (__nearestdepth - (__bind * __depthinc))
    }
    else
    {
        __layername = (__bgstring + string(__bind))
        __layerdepth = ((__farthestdepth - __depthinc) - (__bind * __depthinc))
    }
    if (__bind == -1)
        var __layerid = __collayer
    else
        __layerid = __slots[__bind]
    if (__layerid != -1)
        layer_destroy(__layerid)
    __layerid = layer_create(__layerdepth, __layername)
    layer_x(__layerid, __x)
    layer_y(__layerid, __y)
    layer_hspeed(__layerid, __hspeed)
    layer_vspeed(__layerid, __vspeed)
    var __backel = layer_background_create(__layerid, __back)
    layer_background_visible(__backel, __vis)
    layer_background_htiled(__backel, __htiled)
    layer_background_vtiled(__backel, __vtiled)
    layer_background_xscale(__backel, __xscale)
    layer_background_yscale(__backel, __yscale)
    layer_background_stretch(__backel, __stretch)
    layer_background_blend(__backel, __blend)
    layer_background_alpha(__backel, __alpha)
    __result[0] = __backel
    __result[1] = __layerid
    return __result;
}

function __background_get_element(arg0) {
    var __bind = argument0
    __result[0] = -1
    __result[1] = -1
    __result[2] = -1
    var __fgstring = "Compatibility_Foreground_"
    var __bgstring = "Compatibility_Background_"
    var __fglen = string_length(__fgstring)
    var __bglen = string_length(__bgstring)
    var __layerlist = layer_get_all()
    var __layerlistlength = array_length_1d(__layerlist)
    var __layerid = -1
    var __isforeground = 0
    var __i = 0
    while (__i < __layerlistlength)
    {
        var __layername = layer_get_name(__layerlist[__i])
        if (string_pos(__fgstring, __layername) > 0)
        {
            var __slotchr = string_char_at(__layername, (__fglen + 1))
            if (__slotchr == "")
            {
                __i++
                continue
            }
            else
            {
                var __slot = real(__slotchr)
                if (__slot == __bind)
                {
                    __layerid = __layerlist[__i]
                    __isforeground = 1
                    break
                }
                else
                {
                    __i++
                    continue
                }
            }
        }
        else if (string_pos(__bgstring, __layername) > 0)
        {
            __slotchr = string_char_at(__layername, (__bglen + 1))
            if (__slotchr == "")
            {
                __i++
                continue
            }
            else
            {
                __slot = real(__slotchr)
                if (__slot == __bind)
                {
                    __layerid = __layerlist[__i]
                    __isforeground = 0
                    break
                }
                else
                {
                    __i++
                    continue
                }
            }
        }
        else
        {
            __i++
            continue
        }
    }
    if (__layerid != -1)
    {
        var __els = layer_get_all_elements(__layerid)
        var __elslength = array_length_1d(__els)
        for (__i = 0; __i < __elslength; __i++)
        {
            if (layer_get_element_type(__els[__i]) == 1)
            {
                __result[0] = __els[__i]
                __result[1] = __layerid
                __result[2] = __isforeground
            }
        }
    }
    else
    {
        var __newback = __background_set_element(__bind, false, 0, -1, 0, 0, 1, 1, 1, 1, 0, 0, 0, c_white, 1)
        __result[0] = __newback[0]
        __result[1] = __newback[1]
        __result[2] = 0
    }
    return __result;
}

function __background_get_internal(arg0, arg1, arg2) {
    var __prop = argument0
    var __bind = argument1
    var __backinfo = argument2
    if (__backinfo[0] == -1 || layer_background_exists(__backinfo[1], __backinfo[0]) == 0)
    {
        __backinfo = __background_get_element(__bind)
        if (__backinfo[0] == -1)
            return -1;
    }
    var __res = -1
    var __backid = __backinfo[0]
    var __layerid = __backinfo[1]
    var __isfore = __backinfo[2]
    switch __prop
    {
        case (0):
            __res = layer_get_visible(__layerid)
            break
        case (1):
            __res = __isfore
            break
        case (2):
            __res = layer_background_get_sprite(__backid)
            break
        case (3):
            __res = layer_get_x(__layerid)
            break
        case (4):
            __res = layer_get_y(__layerid)
            break
        case (5):
            __res = sprite_get_width(layer_background_get_index(__backid))
            break
        case (6):
            __res = sprite_get_height(layer_background_get_index(__backid))
            break
        case (7):
            __res = layer_background_get_htiled(__backid)
            break
        case (8):
            __res = layer_background_get_vtiled(__backid)
            break
        case (9):
            __res = layer_background_get_xscale(__backid)
            break
        case (10):
            __res = layer_background_get_yscale(__backid)
            break
        case (11):
            __res = layer_get_hspeed(__layerid)
            break
        case (12):
            __res = layer_get_vspeed(__layerid)
            break
        case (13):
            __res = layer_background_get_blend(__backid)
            break
        case (14):
            __res = layer_background_get_alpha(__backid)
            break
        default:
            break
    }

    return __res;
}
