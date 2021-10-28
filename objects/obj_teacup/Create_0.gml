//pre create
mode = 1
riseSpeed = 6
riseSpeedInitial = 2
riseSpeedBoostFriction = 0.25
riseSpeedBoost = 0
riseSpeedBoostMax = 15
riseSpeedReverse = 12
spinSpeed = 6
endY = (ystart - 100)
jumpOutDuration = 20
jumpInDuration = 20
holdHeight = -1
holdDistance = 0
camFollow = 1
camFollowAfter = 0
specialEnding = undefined
startOffset = undefined
endPos[0] = [undefined, undefined]
endPos[1] = [undefined, undefined]
endPos[2] = [undefined, undefined]
startPos[0] = [undefined, undefined]
startPos[1] = [undefined, undefined]
startPos[2] = [undefined, undefined]
centerX = 1
centerY = 0
returnOnFinish = 0
fadeOutOthers = 0
bulletsApplyToAll = 0
scoreboardExists = 0
scoreboardGoal = 10
tutorialRide = 0
regenerateBullets = 1
camTargetHeightNormal = 350
camTargetHeightReverse = 240
uniqueBulletPattern = -1
uniqueRideExperience = undefined
jumpToRide = -4


idletimer = 0
drawtutorialarrows = 0
drawtutorialarrows_alpha = 0
depthBase = 900000
depthSeparation = 200
depth = depthBase
image_xscale = 2
image_yscale = image_xscale
movedSoFar = 0
state = 0
partySize = 1
reverse = 0
fixcamera = 0
spin = 0
screwSegHeight = (sprite_get_height(spr_teacup_screw) * 2)
camTargetHeight = 0
camFollowMultiplier = 2
cupCharXnudge = -20
cupCharYnudge = -54
cupDistanceFromCenter = 112
cupCharExists = 0
held = 0
heldThisRide = 0
heldAmount = 0
debugHitThisFrame = 0
spinSpeedInitial = 2
jumpMarker = [-1, -1, -1]
shadowSurf = -1
riseSpeedBoostInitial = riseSpeedBoost
theScore = 0
myPitch = 1
scoreboard = noone
teaBullets = 60
teaFilled = 0
rideToRide = 0
crusher = -4
crushed = 0
scoreCol = 14483711
timer = 0
shaketimer = 0
remcamerax = 0
wooshnoise = 0
swallownoise = 0
bouncenoise = 0
teatimer = 0
hitboxxa = 16
hitboxxb = 24
hitboxya = 24
hitboxyb = 40
var _offsetY = [0, -32, 32]
var _offsetX = [64, 0, 0]
for (var i = 0; i < 3; i++)
{
    var _check = endPos[i]
    if (_check[0] == undefined)
        endPos[i] = [((x + 200) + _offsetX[i]), ((endY + _offsetY[i]) - 64)]
    _check = startPos[i]
    if (_check[0] == undefined)
        startPos[i] = [((x - 200) - _offsetX[i]), ((ystart + _offsetY[i]) - 64)]
}
for (i = 0; i < 3; i += 1)
{
    cup_char[i] = instance_create_depth(0, 0, 0, obj_markercup)
    with (cup_char[i])
    {
        sprite_index = spr_teacup_empty
        image_speed = 0
        image_xscale = 2
        image_yscale = 2
        scr_depth()
        spin = 0
    }
}
if (startOffset != undefined)
{
    state = 0
    y += startOffset
}
if scoreboardExists
{
    scoreboard = instance_create_depth(x, y, (depth - 9999), obj_teacup_scoreboard)
    with (scoreboard)
        scoreCol = 14483711
}
if (uniqueBulletPattern != -1)
    scr_tb_pattern(uniqueBulletPattern)
else
    scr_tb_pattern()
if (global.chapter == 2)
{
    //if (room == room_dw_mansion_b_west_2f && global.tempflag[33] > 0)
    //{
    //    y = 600
    //    riseSpeedInitial = 12
    //    riseSpeed = 12
    //}
    //if (room == room_dw_city_postbaseball_1)
    //    state = 999
}
looptrack = -10

function scr_tb_pattern(pattern) {
    var _pattern = room
    if (argument_count > 0)
    {
        _pattern = argument[0]
        switch _pattern
        {
            case 0:
                var _spacing = 84
                var _distance = 720
                var _bullets = (_distance div _spacing)
                for (var i = 0; i < (_bullets - 1); i++)
                {
                    var _h = (100 + (i * _spacing))
                    bullet = scr_tb_make(_h, (270 + (i * 40)), 0, 1, 0)
                    if (i == (_bullets - 1))
                        bullet.boostAmount = 16
                }
                break
            case 1:
                _spacing = 84
                _distance = 1040
                _bullets = (_distance div _spacing)
                for (i = 0; i < (_bullets - 1); i++)
                {
                    _h = (100 + (i * _spacing))
                    bullet = scr_tb_make(_h, (270 - (i * 40)), 0, 1, 0)
                    if (i == (_bullets - 1))
                        bullet.boostAmount = 16
                }
                break
            case 2:
                lasti = 6
                bangle[0] = 270
                bangle[1] = 230
                bangle[2] = 190
                bangle[3] = 230
                bangle[4] = 270
                bangle[5] = 310
                bangle[6] = 350
                for (i = 0; i <= lasti; i++)
                {
                    for (j = 0; j < 4; j++)
                    {
                        bullet = scr_tb_make(((240 + (i * 360)) + (j * 40)), bangle[i], 0, 1, 0)
                        bullet.boostAmount = 12
                    }
                }
                break
            case 3:
                lasti = 5
                bangle[0] = 270
                bangle[1] = 230
                bangle[2] = 190
                bangle[3] = 230
                bangle[4] = 270
                bangle[5] = 310
                for (i = 0; i <= lasti; i++)
                {
                    for (j = 0; j < 3; j++)
                    {
                        bullet = scr_tb_make(((140 + (i * 320)) + (j * 40)), bangle[i], 0, 1, 0)
                        bullet.boostAmount = 12
                    }
                }
                break
            case 4:
                lasti = 2
                bangle[0] = 270
                bangle[1] = 310
                bangle[2] = 270
                for (i = 0; i <= lasti; i++)
                {
                    for (j = 0; j < 4; j++)
                    {
                        bullet = scr_tb_make(((140 + (i * 360)) + (j * 40)), bangle[i], 0, 1, 0)
                        bullet.boostAmount = 12
                    }
                }
                break
            case 5:
                for (i = 0; i < 5; i++)
                {
                    bullet = scr_tb_make((140 + (i * 40)), 270, 0, 1, 0)
                    bullet.boostAmount = 12
                }
                break
            case 52:
                for (i = 0; i < 4; i++)
                {
                    bullet = scr_tb_make((120 + (i * 40)), 270, 0, 1, 0)
                    bullet.boostAmount = 12
                }
                break
            case 53:
                for (i = 0; i < 3; i++)
                {
                    bullet = scr_tb_make((100 + (i * 40)), 270, 0, 1, 0)
                    bullet.boostAmount = 12
                }
                break
            case 6:
                riseSpeed = 3
                riseSpeedBoostInitial = 8
                riseSpeedBoost = riseSpeedBoostInitial
                riseSpeedBoostMax = 10
                riseSpeedBoostFriction = 0.15
                lasti = 9
                nowdir = 270
                for (i = 0; i <= lasti; i++)
                {
                    bullet = scr_tb_make((400 + (i * 140)), nowdir, 0, 1, 0)
                    bullet.boostAmount = 6
                    if (i == lasti)
                        bullet.boostAmount = 10
                    nowdir += choose(30, 30, 0, -30, -30)
                    if (nowdir <= 180)
                        nowdir = choose(180, 210, 210)
                    if (nowdir >= 360)
                        nowdir = choose(360, 330, 330)
                }
                break
            case 7:
                riseSpeed = 3
                riseSpeedBoostInitial = 6
                riseSpeedBoost = riseSpeedBoostInitial
                riseSpeedBoostMax = 9
                riseSpeedBoostFriction = 0.25
                lasti = 15
                nowdir = 270
                for (i = 0; i <= lasti; i++)
                {
                    bullet = scr_tb_make((200 + (i * 120)), nowdir, 0, 1, 0)
                    bullet.boostAmount = 6
                    if (i == lasti)
                        bullet.boostAmount = 10
                    nowdir += choose(30, 30, 0, -30, -30)
                    if (nowdir <= 180)
                        nowdir = choose(180, 210, 210)
                    if (nowdir >= 360)
                        nowdir = choose(360, 330, 330)
                }
                break
            case 8:
                riseSpeed = 3
                riseSpeedBoostInitial = 8
                riseSpeedBoost = riseSpeedBoostInitial
                riseSpeedBoostMax = 10
                riseSpeedBoostFriction = 0.15
                lasti = 5
                nowdir = 270
                for (i = 0; i <= lasti; i++)
                {
                    bullet = scr_tb_make((400 + (i * 180)), nowdir, 0, 1, 0)
                    bullet.boostAmount = 6
                    if (i == lasti)
                        bullet.boostAmount = 10
                    nowdir += choose(30, 30, 0, -30, -30)
                    if (nowdir <= 240)
                        nowdir = choose(240, 270)
                    if (nowdir >= 300)
                        nowdir = choose(300, 270)
                }
                scoreboardGoal = 6
                break
            default:
                break
        }

    }
    else
    {
        switch _pattern
        {
            case 19:
                scr_tb_make(500, 90, 0, 3, 0)
                scr_tb_make(600, 120, 0, 3, 0)
                scr_tb_make(700, 150, 0, 3, 0)
                scr_tb_make(800, 180, 0, 3, 0)
                scr_tb_make_split(1400, 0, spinSpeed, 2, 0)
                scr_tb_make_split(1500, 30, spinSpeed, 2, 0)
                scr_tb_make_split(1600, 60, spinSpeed, 2, 0)
                scr_tb_make_split(1800, 0, spinSpeed, 2, 0)
                scr_tb_make_split(2000, 10, spinSpeed, 3, 0)
                scr_tb_make_split(2200, 20, spinSpeed, 4, 0)
                for (i = 0; i < 10; i++)
                {
                    scr_tb_make((2300 + (i * 20)), 230, 0, 0, 0)
                    scr_tb_make((2300 + (i * 20)), 270, 0, 1, 0)
                    scr_tb_make((2300 + (i * 20)), 310, 0, 0, 0)
                }
                for (i = 0; i < 64; i++)
                {
                    scr_tb_make((2700 + (i * 20)), (i * 10), 0, 0, 1)
                    scr_tb_make((2700 + (i * 20)), (180 + (i * 10)), 0, 0, 1)
                }
                break
            case 88:
                _spacing = 74
                _distance = 440
                _bullets = (_distance div _spacing)
                for (i = 0; i < _bullets; i++)
                {
                    _h = (60 + (i * _spacing))
                    bullet = scr_tb_make((_h - 5), (350 + (i * 40)), 0, 1, 0)
                    bullet.boostAmount = 6
                    if (i == (_bullets - 1))
                        bullet.boostAmount = 8
                }
                break
            case 174:
                var _angle = [30, 150, 270]
                lasti = 2
                for (i = 0; i <= lasti; i++)
                {
                    for (j = 0; j < 5; j++)
                        bullet = scr_tb_make(((500 + (i * 280)) + (j * 30)), _angle[i], 0, 0, 0)
                }
                scr_tb_make_split(1500, 90, 0, 2, 4)
                scr_tb_make_split(1800, 90, 0, 3, 4)
                scr_tb_make_split(2100, 0, 0, 4, 4)
                scr_tb_make_split(2400, 45, 0, 4, 4)
                break
            case 177:
                scr_tb_make_split(650, 0, -3, 3, 0)
                scr_tb_make_split(840, 30, 3, 3, 0)
                scr_tb_make_split(1030, 60, -3, 3, 0)
                scr_tb_make_split(1220, 90, 5, 3, 0)
                scr_tb_make_split(1410, 90, -5, 3, 0)
                scr_tb_make_split(1600, 90, 5, 3, 0)
                scr_tb_make_split(1790, 90, 6, 3, 0)
                scr_tb_make_split(1980, 90, 6, 3, 0)
                scr_tb_make_split(2170, 90, 6, 3, 0)
                break
            case 176:
                scr_tb_make_split(650, 90, 6, 3, 0)
                scr_tb_make_split(700, 90, 6, 3, 0)
                scr_tb_make_split(750, 90, 6, 3, 0)
                scr_tb_make_split(1000, 90, -6, 3, 0)
                scr_tb_make_split(1050, 90, -6, 3, 0)
                scr_tb_make_split(1100, 90, -6, 3, 0)
                scr_tb_make_split(1350, 90, 6, 3, 0)
                scr_tb_make_split(1400, 90, 6, 3, 0)
                scr_tb_make_split(1450, 90, 6, 3, 0)
                scr_tb_make_split(1500, 90, 6, 3, 3)
                break
            case 175:
                scr_tb_make_split(640, 70, -3, 2, 4)
                scr_tb_make_split(900, 180, 3, 2, 4)
                scr_tb_make(1100, 0, -4, 3, 0)
                scr_tb_make(1100, 180, -4, 3, 0)
                scr_tb_make(1960, 0, 4, 3, 0)
                scr_tb_make(1960, 120, 4, 3, 0)
                scr_tb_make(1960, 240, 4, 3, 0)
                break
            case 184:
                var aa = 300
                for (var ii = 0; ii < 10; ii++)
                    scr_tb_make_split(((aa + 950) + (ii * 40)), 90, 10, 3, 0)
                for (ii = 0; ii < 10; ii++)
                    scr_tb_make_split(((aa + 1600) + (ii * 40)), 90, -10, 3, 0)
                var nn = (1500 + aa)
                scr_tb_make_crescent((750 + nn), 270, 20, 1, 0, 14)
                scr_tb_make_crescent((1000 + nn), 0, 20, 1, 0, 14)
                scr_tb_make_crescent((1250 + nn), 90, 20, 1, 0, 14)
                scr_tb_make_crescent((1500 + nn), 180, 20, 1, 0, 14)
                scr_tb_make_crescent((1750 + nn), 90, 20, 1, 0, 14)
                scr_tb_make_crescent((2000 + nn), 0, 20, 0, 0, 8)
                scr_tb_make_crescent((2200 + nn), 90, 20, 0, 0, 10)
                scr_tb_make_crescent((2400 + nn), 180, 20, 0, 0, 10)
                scr_tb_make_crescent((2600 + nn), 270, 20, 0, 0, 10)
                scr_tb_make_crescent((2800 + nn), 0, 20, 0, 0, 13)
                scr_tb_make_crescent((3000 + nn), 90, 20, 0, 0, 13)
                scr_tb_make_crescent((3200 + nn), 180, 20, 0, 0, 13)
                scr_tb_make_crescent((3400 + nn), 270, 20, 0, 0, 13)
                var mm = (5100 + aa)
                for (ii = 0; ii < 40; ii++)
                    scr_tb_make_split(((ii * 32) + mm), (90 + (10 * ii)), 6.25, 3, 0)
            default:
                break
        }

    }
    return;
}

function scr_tb_make(y_off, _spin, _spinrate, _hittype, _linetocenter) {
    var _mytbullet = instance_create(x, (y - argument0), obj_teacup_bullet)
    with (_mytbullet)
    {
        spin = argument1
        spinrate = argument2
        hitType = argument3
        master = other.id
        if (hitType == 1)
        {
            colClose = c_fuchsia
            colFar = 16711680
            image_blend = c_fuchsia
        }
        if (hitType == 2)
        {
            colClose = c_lime
            colFar = 16711680
            image_blend = c_lime
        }
        if (hitType == 3)
        {
            colClose = 0xFF4040
            colFar = 8388608
            image_blend = colClose
        }
        if (hitType == 5)
        {
            image_blend = 0x3F557F
            colClose = image_blend
            colFar = image_blend
        }
        if (hitType == 4)
        {
            sprite_index = spr_teacup_bullet_big
            bulletCollisionAngle = 20
        }
        lineToCenter = argument4
        if (hitType == 3 || hitType == 5)
            lineToCenter = 0
        if (hitType == 1 || hitType == 2)
        {
            sprite_index = spr_teacup_bullet_good
            groundForgiveness = 1
            bulletCollisionAngle = 28
            bulletHitHeight = 80
        }
        spriteWidthRoot = sprite_get_width(sprite_index)
        spriteHeightRoot = sprite_get_width(sprite_index)
    }
    return _mytbullet;
}


function scr_tb_make_crescent(y_off, _spin, _spinrate, _hittype, _linetocenter, amount) {
    for (var i = 0; i < argument5; i += 1)
        scr_tb_make(argument0, (argument1 + (i * argument2)), argument3, argument4, 1)
    return;
}

function scr_tb_make_split(y_off, _spin, _spinrate, _hittype, _linetocenter) {
    for (var i = 0; i < argument3; i += 1)
    {
        var _bul = scr_tb_make(argument0, (argument1 + ((i / argument3) * 360)), argument2, argument4, 1)
        with (_bul)
        {
            offsetAngle = ((i / argument3) * 360)
            if (i == 0)
                eatMe = 1
        }
    }
    return;
}

