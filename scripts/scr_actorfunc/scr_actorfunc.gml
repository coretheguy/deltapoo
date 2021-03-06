function scr_actor_setup(_id, _inst, _name) {
    _actorid = argument0
    _actorinstance = argument1
    _actorname = argument2
    obj_cutscene_master.actor_id[_actorid] = _actorinstance
    obj_cutscene_master.actor_name[_actorid] = _actorname
    with (_actorinstance)
    {
        number = argument0
        scr_set_facing_sprites(argument2)
    }
    return;
}

function scr_actor_setup_nofacing(_id, _inst, _name) {
    _actorid = argument0
    _actorinstance = argument1
    _actorname = argument2
    obj_cutscene_master.actor_id[_actorid] = _actorinstance
    obj_cutscene_master.actor_name[_actorid] = _actorname
    _actorinstance.name = _actorname
    return;
}

function scr_maincharacters_actors() {
    actor_count = 0
    kr = 0
    kr_actor = instance_create(obj_mainchara.x, obj_mainchara.y, obj_actor)
    scr_actor_setup(kr, kr_actor, "kris")
    kr_actor.sprite_index = obj_mainchara.sprite_index
    kr_actor.depth = obj_mainchara.depth
    with (obj_mainchara)
        visible = false
    for (__jj = 0; __jj < array_length(global.cinstance); __jj++)
    {
        if i_ex(global.cinstance[__jj])
        {
            if (global.cinstance[__jj].name == "susie")
            {
                actor_count++
                su = (__jj + 1)
                su_actor = instance_create(global.cinstance[__jj].x, global.cinstance[__jj].y, obj_actor)
                scr_actor_setup(su, su_actor, "susie")
                su_actor.sprite_index = global.cinstance[__jj].sprite_index
                su_actor.depth = global.cinstance[__jj].depth
                with (global.cinstance[__jj])
                    visible = false
            }
            if (global.cinstance[__jj].name == "ralsei")
            {
                actor_count++
                ra = (__jj + 1)
                ra_actor = instance_create(global.cinstance[__jj].x, global.cinstance[__jj].y, obj_actor)
                scr_actor_setup(ra, ra_actor, "ralsei")
                ra_actor.sprite_index = global.cinstance[__jj].sprite_index
                ra_actor.depth = global.cinstance[__jj].depth
                with (global.cinstance[__jj])
                    visible = false
            }
            if (global.cinstance[__jj].name == "noelle")
            {
                actor_count++
                no = (__jj + 1)
                no_actor = instance_create(global.cinstance[__jj].x, global.cinstance[__jj].y, obj_actor)
                scr_actor_setup(no, no_actor, "noelle")
                no_actor.sprite_index = global.cinstance[__jj].sprite_index
                no_actor.depth = global.cinstance[__jj].depth
                with (global.cinstance[__jj])
                    visible = false
            }
        }
    }
    return;
}

function scr_findactor(_name) {
    with (obj_cutscene_master)
    {
        __foundactor = -1
        for (_jjj = 0; _jjj < 20; _jjj++)
        {
            if (actor_name[_jjj] == argument0 && i_ex(actor_id[_jjj]))
                __foundactor = _jjj
        }
        var temp = __foundactor
        return temp;
    }
}



function scr_findactorinstance(_name) {
    with (obj_cutscene_master)
    {
        __foundactor = -1
        for (_jjj = 0; _jjj < 20; _jjj++)
        {
            if (actor_name[_jjj] == argument0 && i_ex(actor_id[_jjj]))
                __foundactor = actor_id[_jjj]
        }
        var temp = __foundactor
        return temp;
    }
}

