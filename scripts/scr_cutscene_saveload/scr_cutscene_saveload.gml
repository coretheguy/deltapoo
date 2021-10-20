function scr_cutscene_savestate() {
    scr_debug_print("Cutscene Saved")
    masterArray = variable_instance_get_names(id)
    for (var i = 0; i < array_length_1d(masterArray); i++)
        myVar[i] = variable_instance_get(id, masterArray[i])
    remCameraX = camerax()
    remCameraY = cameray()
    for (i = 0; i < 20; i++)
    {
        actorSaved[i] = 0
        if i_ex(actor_id[i])
        {
            actorSaved[i] = 1
            with (actor_id[i])
                scr_instance_save_local_vars()
        }
    }
    for (i = 0; i < 10; i++)
    {
        objectSaved[i] = 0
        if i_ex(save_object[i])
        {
            objectSaved[i] = 1
            with (save_object[i])
                scr_instance_save_local_vars()
        }
    }
    return;
}

function scr_cutscene_loadstate() {
    scr_debug_print("Cutscene Loaded")
    for (var i = 0; i < 20; i++)
    {
        if i_ex(actor_id[i])
        {
            if (actorSaved[i] == 1)
            {
                with (actor_id[i])
                    scr_instance_load_local_vars()
            }
        }
    }
    for (i = 0; i < 10; i++)
    {
        if i_ex(save_object[i])
        {
            if (objectSaved[i] == 1)
            {
                with (save_object[i])
                    scr_instance_load_local_vars()
            }
        }
    }
    for (i = 0; i < array_length_1d(masterArray); i++)
        variable_instance_set(id, masterArray[i], myVar[i])
    camerax_set(remCameraX)
    cameray_set(remCameraY)
    with (obj_panner)
        instance_destroy()
    with (obj_move_actor)
        instance_destroy()
    with (obj_move_to_point)
        instance_destroy()
    with (obj_shakeobj)
        instance_destroy()
    with (obj_shake)
        instance_destroy()
    with (obj_dialoguer)
        instance_destroy()
    with (obj_writer)
        instance_destroy()
    with (obj_face)
        instance_destroy()
    with (obj_cutscene_delaycmd)
        instance_destroy()
    with (obj_jump_to_point)
        instance_destroy()
    with (obj_stickto)
        instance_destroy()
    with (obj_lerpvar)
        instance_destroy()
    loadedState = 1
    waiting = 0
    scr_cutscene_master_commands_initialize()
    return;
}


function scr_instance_save_local_vars() {
    __quickSaved = 1
    __masterArray = variable_instance_get_names(id)
    for (var __n = 0; __n < array_length_1d(__masterArray); __n++)
    {
        ___saveSpriteIndex = sprite_index
        ___saveImageIndex = image_index
        ___saveImageSpeed = image_speed
        ___saveXscale = image_xscale
        ___saveYscale = image_yscale
        ___saveAlpha = image_alpha
        ___saveBlend = image_blend
        ___saveAngle = image_angle
        ___saveX = x
        ___saveY = y
        ___saveSpeed = speed
        ___saveDirection = direction
        ___saveDepth = depth
        ___saveVisible = visible
        ___saveGravity = gravity
        ___saveGravityDirection = gravity_direction
        ___saveFriction = friction
        if (__masterArray[__n] == "__myVar")
            __myVar[__n] = 0
        else
            __myVar[__n] = variable_instance_get(id, __masterArray[__n])
    }
    return;
}


function scr_instance_load_local_vars() {
    for (var __n = 0; __n < array_length_1d(__masterArray); __n++)
    {
        sprite_index = ___saveSpriteIndex
        image_index = ___saveImageIndex
        image_speed = ___saveImageSpeed
        image_xscale = ___saveXscale
        image_yscale = ___saveYscale
        image_alpha = ___saveAlpha
        image_blend = ___saveBlend
        image_angle = ___saveAngle
        x = ___saveX
        y = ___saveY
        speed = ___saveSpeed
        direction = ___saveDirection
        depth = ___saveDepth
        visible = ___saveVisible
        gravity = ___saveGravity
        gravity_direction = ___saveGravityDirection
        friction = ___saveFriction
        if (__masterArray[__n] != "__myVar" && __masterArray[__n] != "__masterArray")
            variable_instance_set(id, __masterArray[__n], __myVar[__n])
    }
    return;
}


