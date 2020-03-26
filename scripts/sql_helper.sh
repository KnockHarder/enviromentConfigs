#!/bin/bash
column_names=($( echo ${@} | tr -d , | tr [a-z] [A-Z]))
field_names=($( echo ${column_names[*]} | \
		    sed -r "s/([A-Z]+)/\L\1\E/g;s/(^|\s)([a-z]+)_/ /g;s/_(\w)/\U\1\E/g" ))
for (( i=0; i < $#; i ++ )); do
    column=${column_names[$i]}
    field=${field_names[$i]}
    value=#\{${field}\}
    item=#\{item.${field}\}
    
    column_sql=${column_sql}${column}," "
    values_sql=${values_sql}${value}," "
    select_sql=${select_sql}${column}\ AS\ ${field}," "
    set_sql=${set_sql}${column}=${value}," "
    items_sql=${items_sql}${item}," "
    set_item_sql=${set_item_sql}${column}=${item}," "
done

echo "==========================="
echo \(\ ${column_sql:0:-2}\ \)
echo
echo \(\ ${values_sql:0:-2}\ \)
echo
echo ${select_sql:0:-2}
echo
echo ${set_sql:0:-2}
echo
echo \(\ ${items_sql:0:-2}\ \)
echo
echo ${set_item_sql:0:-2}
    
