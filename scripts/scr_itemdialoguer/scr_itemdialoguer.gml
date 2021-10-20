function scr_itemdialoguer(){

}

function scr_iteminfo_temp(item) {
    for (i = 0; i < 12; i += 1)
    {
        itemid = tempitem[i][argument0]
        scr_iteminfo(itemid)
        tempitemnameb[i][argument0] = itemnameb
        tempitemdescb[i][argument0] = itemdescb
        tempitemvalue[i][argument0] = value
        tempitemusable[i][argument0] = usable
    }
    return;
}

