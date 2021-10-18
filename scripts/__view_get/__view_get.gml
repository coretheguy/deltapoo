function __view_get(argument0, argument1) {
    var __prop = argument0
    var __index = argument1
    var __res = -1
    switch __prop
    {
        case 0:
            var __cam = view_get_camera(__index)
            __res = camera_get_view_x(__cam)
            break
        case 1:
            __cam = view_get_camera(__index)
            __res = camera_get_view_y(__cam)
            break
        case 2:
            __cam = view_get_camera(__index)
            __res = camera_get_view_width(__cam)
            break
        case 3:
            __cam = view_get_camera(__index)
            __res = camera_get_view_height(__cam)
            break
        case 4:
            __cam = view_get_camera(__index)
            __res = camera_get_view_angle(__cam)
            break
        case 5:
            __cam = view_get_camera(__index)
            __res = camera_get_view_border_x(__cam)
            break
        case 6:
            __cam = view_get_camera(__index)
            __res = camera_get_view_border_y(__cam)
            break
        case 7:
            __cam = view_get_camera(__index)
            __res = camera_get_view_speed_x(__cam)
            break
        case 8:
            __cam = view_get_camera(__index)
            __res = camera_get_view_speed_y(__cam)
            break
        case 9:
            __cam = view_get_camera(__index)
            __res = camera_get_view_target(__cam)
            break
        case 10:
            __res = view_get_visible(__index)
            break
        case 11:
            __res = view_get_xport(__index)
            break
        case 12:
            __res = view_get_yport(__index)
            break
        case 13:
            __res = view_get_wport(__index)
            break
        case 14:
            __res = view_get_hport(__index)
            break
        case 15:
            __res = view_get_camera(__index)
            break
        case 16:
            __res = view_get_surface_id(__index)
            break
        default:
            break
    }

    return __res;
}

