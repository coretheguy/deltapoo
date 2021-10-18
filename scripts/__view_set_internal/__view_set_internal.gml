function __view_set_internal(argument0, argument1, argument2) {
    var __prop = argument0
    var __index = argument1
    var __val = argument2
    switch __prop
    {
        case 0:
            var __cam = view_get_camera(__index)
            camera_set_view_pos(__cam, __val, camera_get_view_y(__cam))
            break
        case 1:
            __cam = view_get_camera(__index)
            camera_set_view_pos(__cam, camera_get_view_x(__cam), __val)
            break
        case 2:
            __cam = view_get_camera(__index)
            camera_set_view_size(__cam, __val, camera_get_view_height(__cam))
            break
        case 3:
            __cam = view_get_camera(__index)
            camera_set_view_size(__cam, camera_get_view_width(__cam), __val)
            break
        case 4:
            __cam = view_get_camera(__index)
            camera_set_view_angle(__cam, __val)
            break
        case 5:
            __cam = view_get_camera(__index)
            camera_set_view_border(__cam, __val, camera_get_view_border_y(__cam))
            break
        case 6:
            __cam = view_get_camera(__index)
            camera_set_view_border(__cam, camera_get_view_border_x(__cam), __val)
            break
        case 7:
            __cam = view_get_camera(__index)
            camera_set_view_speed(__cam, __val, camera_get_view_speed_y(__cam))
            break
        case 8:
            __cam = view_get_camera(__index)
            camera_set_view_speed(__cam, camera_get_view_speed_x(__cam), __val)
            break
        case 9:
            __cam = view_get_camera(__index)
            camera_set_view_target(__cam, __val)
            break
        case 10:
            __res = view_set_visible(__index, __val)
            break
        case 11:
            __res = view_set_xport(__index, __val)
            break
        case 12:
            __res = view_set_yport(__index, __val)
            break
        case 13:
            __res = view_set_wport(__index, __val)
            break
        case 14:
            __res = view_set_hport(__index, __val)
            break
        case 15:
            __res = view_set_camera(__index, __val)
            break
        case 16:
            __res = view_set_surface_id(__index, __val)
            break
        default:
            break
    }

    return 0;
}
