function scr_ease_in(_var, _type) {
    if (argument1 < -3 || argument1 > 7)
        return argument0;
    switch argument1
    {
        case -3:
            var temp = ease_in_bounce(argument0, 0, 1, 1)
            return temp;
        case -2:
            temp = ease_in_elastic(argument0, 0, 1, 1)
            return temp;
        case -1:
            var _s = 1.70158
            temp = ((argument0 * argument0) * (((_s + 1) * argument0) - _s))
            return temp;
        case 0:
            temp = argument0
            return temp;
        case 1:
            temp = ((-cos((argument0 * 1.5707963267948966))) + 1)
            return temp;
        case 6:
            temp = power(2, (10 * (argument0 - 1)))
            return temp;
        case 7:
            temp = (-(sqrt((1 - sqr(argument0))) - 1))
            return temp;
        default:
            temp = power(argument0, argument1)
            return temp;
    }

}

function scr_ease_out(_var, _type) {
    if (argument1 < -3 || argument1 > 7)
        return argument0;
    switch argument1
    {
        case -3:
            var temp = ease_out_bounce(argument0, 0, 1, 1)
            return temp;
        case -2:
            temp = ease_out_elastic(argument0, 0, 1, 1)
            return temp;
        case -1:
            temp = ease_out_back(argument0, 0, 1, 1)
            return temp;
        case 0:
            temp = argument0
            return temp;
        case 1:
            temp = sin((argument0 * 1.5707963267948966))
            return temp;
        case 2:
            temp = ((-argument0) * (argument0 - 2))
            return temp;
        case 6:
            temp = ((-power(2, (-10 * argument0))) + 1)
            return temp;
        case 7:
            argument0--
            temp = sqrt((1 - (argument0 * argument0)))
            return temp;
        default:
            argument0--
            if (argument1 == 4)
            {
                temp = (-1 * (power(argument0, argument1) - 1))
                return temp;
            }
            else
            {
                temp = (power(argument0, argument1) + 1)
                return temp;
            }
    }

}

function scr_ease_inout(_var, _type) {
    if (argument1 < -3 || argument1 > 7)
        return argument0;
    if (argument1 == -3)
        return ease_inout_bounce(argument0, 0, 1, 1);
    else if (argument1 == -2)
        return ease_inout_elastic(argument0, 0, 1, 1);
    else if (argument1 == -1)
        return ease_inout_back(argument0, 0, 1, 1);
    else if (argument1 == 1)
        return (-0.5 * cos(((pi * argument0) - 1)));
    else if (argument1 == 0)
        return argument0;
    argument0 *= 2
    if (argument0 < 1)
        return (0.5 * scr_ease_in(argument0, argument1));
    else
    {
        argument0--
        return (0.5 * (scr_ease_out(argument0, argument1) + 1));
    }
}

function ease_inout_elastic(a1, a2, a3, a4) {
    var _s = 1.70158
    var _p = 0
    var _a = argument2
    if (argument0 == 0 || _a == 0)
        return argument1;
    argument0 /= (argument3 * 0.5)
    if (argument0 == 2)
        return (argument1 + argument2);
    if (!_p)
        _p = (argument3 * 0.44999999999999996)
    if (_a < abs(argument2))
    {
        _a = argument2
        _s = (_p * 0.25)
    }
    else
        _s = ((_p / (2 * pi)) * arcsin((argument2 / _a)))
    if (argument0 < 1)
        return ((-0.5 * ((_a * power(2, (10 * --argument0))) * sin(((((argument0 * argument3) - _s) * (2 * pi)) / _p)))) + argument1);
    return (((((_a * power(2, (-10 * --argument0))) * sin(((((argument0 * argument3) - _s) * (2 * pi)) / _p))) * 0.5) + argument2) + argument1);
}



function ease_inout_bounce(a1, a2, a3, a4) {
    if (argument0 < (argument3 * 0.5))
        return ((ease_in_bounce((argument0 * 2), 0, argument2, argument3) * 0.5) + argument1);
    return (((ease_out_bounce(((argument0 * 2) - argument3), 0, argument2, argument3) * 0.5) + (argument2 * 0.5)) + argument1);
}



function ease_inout_back(a1, a2, a3, a4) {
    var _s = 1.70158
    argument0 /= argument3
    argument0 *= 2
    if (argument0 < 1)
    {
        _s *= 1.525
        return (((argument2 * 0.5) * ((argument0 * argument0) * (((_s + 1) * argument0) - _s))) + argument1);
    }
    argument0 -= 2
    _s *= 1.525
    return (((argument2 * 0.5) * (((argument0 * argument0) * (((_s + 1) * argument0) + _s)) + 2)) + argument1);
}



function ease_in_bounce(arg1, arg2, arg3, arg4) {
    return ((argument2 - ease_out_bounce((argument3 - argument0), 0, argument2, argument3)) + argument1);
}

function ease_in_elastic(a1, a2, a3, a4) {
    var _s = 1.70158
    var _p = 0
    var _a = argument2
    if (argument0 == 0 || _a == 0)
        return argument1;
    argument0 /= argument3
    if (argument0 == 1)
        return (argument1 + argument2);
    if (_p == 0)
        _p = (argument3 * 0.3)
    if (_a < abs(argument2))
    {
        _a = argument2
        _s = (_p * 0.25)
    }
    else
        _s = ((_p / (2 * pi)) * arcsin((argument2 / _a)))
    return ((-((_a * power(2, (10 * --argument0))) * sin(((((argument0 * argument3) - _s) * (2 * pi)) / _p)))) + argument1);
}




function ease_out_bounce(a1, a2, a3, a4) {
    argument0 /= argument3
    if (argument0 < 0.36363636363636365)
        return ((argument2 * ((7.5625 * argument0) * argument0)) + argument1);
    else if (argument0 < 0.7272727272727273)
    {
        argument0 -= 0.5454545454545454
        return ((argument2 * (((7.5625 * argument0) * argument0) + 0.75)) + argument1);
    }
    else if (argument0 < 0.9090909090909091)
    {
        argument0 -= 0.8181818181818182
        return ((argument2 * (((7.5625 * argument0) * argument0) + 0.9375)) + argument1);
    }
    else
    {
        argument0 -= 0.9545454545454546
        return ((argument2 * (((7.5625 * argument0) * argument0) + 0.984375)) + argument1);
    }
}

function ease_out_elastic(a1, a2, a3, a4) {
    var _s = 1.70158
    var _p = 0
    var time = argument0
    var start = argument1
    var change = argument2
    var duration = argument3
    if (time == 0 || change == 0)
        return start;
    time /= duration
    if (time == 1)
        return (start + argument2);
    if (!_p)
        _p = (duration * 0.3)
    if (change < abs(argument2))
    {
        change = argument2
        _s = (_p * 0.25)
    }
    else
        _s = ((_p / (2 * pi)) * arcsin((argument2 / change)))
    return ((((change * power(2, (-10 * time))) * sin(((((time * duration) - _s) * (2 * pi)) / _p))) + argument2) + start);
}

function ease_out_back(a1, a2, a3, a4) {
    var _s = 1.70158
    argument0 = ((argument0 / argument3) - 1)
    return ((argument2 * (((argument0 * argument0) * (((_s + 1) * argument0) + _s)) + 1)) + argument1);
}

function ease_out_cubic(a1, a2, a3, a4) {
    return ((argument2 * (power(((argument0 / argument3) - 1), 3) + 1)) + argument1);
}

