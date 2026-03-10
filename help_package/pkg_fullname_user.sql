CREATE OR REPLACE PACKAGE pkg_fullname_user
IS
SUBTYPE fullname_t IS VARCHAR2 (155);
FUNCTION drv_pass_fullname (f_first_name IN driver.first_name%type
                      ,f_last_name IN driver.last_name%type)
    RETURN fullname_t;
FUNCTION drv_fullname_activity (f_driver_id IN driver.id_driver%type)
    RETURN fullname_t; 
FUNCTION pass_fullname_activity (f_passenger_id IN passenger.id_passenger%type)
    RETURN fullname_t;
FUNCTION drv_not_activity (f_driver_id IN driver.id_driver%type)
    RETURN fullname_t;
FUNCTION pass_not_activity (f_passenger_id IN passenger.id_passenger%type)
    RETURN fullname_t;
END pkg_fullname_user;
/
CREATE OR REPLACE PACKAGE BODY pkg_fullname_user
IS
FUNCTION drv_pass_fullname (f_first_name IN driver.first_name%type
                     ,f_last_name IN driver.last_name%type)
                          RETURN fullname_t
IS
BEGIN
RETURN f_first_name||' '||f_last_name;
EXCEPTION
WHEN OTHERS
THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

FUNCTION drv_fullname_activity (f_driver_id IN driver.id_driver%type)
    RETURN fullname_t
IS
retval fullname_t;
BEGIN
SELECT (first_name||' '||last_name) full_name
INTO retval
FROM driver
WHERE id_driver = f_driver_id
AND stop_date IS NULL;
DBMS_OUTPUT.PUT_LINE('Статус: Активный пользователь');
RETURN retval;
EXCEPTION
WHEN NO_DATA_FOUND 
THEN 
DBMS_OUTPUT.PUT_LINE('Data is not found');
WHEN TOO_MANY_ROWS 
THEN 
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

FUNCTION pass_fullname_activity (f_passenger_id IN passenger.id_passenger%type)
    RETURN fullname_t
IS
 retval fullname_t;
stop_d passenger.stop_date%type;
BEGIN
SELECT (first_name||' '||last_name) full_name
INTO retval
FROM passenger
WHERE id_passenger = f_passenger_id
AND stop_date IS NULL;
DBMS_OUTPUT.PUT_LINE('Статус: Активный пользователь');
RETURN retval;
EXCEPTION
WHEN NO_DATA_FOUND 
THEN 
DBMS_OUTPUT.PUT_LINE('Data is not found');
WHEN TOO_MANY_ROWS 
THEN 
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/*Выбор неактивных водителей*/
FUNCTION drv_not_activity (f_driver_id IN driver.id_driver%type)
    RETURN fullname_t
IS
retval fullname_t;
BEGIN
SELECT (first_name||' '||last_name) full_name
INTO retval
FROM driver
WHERE id_driver = f_driver_id
AND stop_date IS NOT NULL;
DBMS_OUTPUT.PUT_LINE('Статус: Неактивный пользователь');
RETURN retval;
EXCEPTION
WHEN NO_DATA_FOUND 
THEN 
DBMS_OUTPUT.PUT_LINE('Data is not found');
WHEN TOO_MANY_ROWS 
THEN 
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/*Поиск неактивных пассажиров*/
FUNCTION pass_not_activity (f_passenger_id IN passenger.id_passenger%type)
    RETURN fullname_t
IS
 retval fullname_t;
stop_d passenger.stop_date%type;
BEGIN
SELECT (first_name||' '||last_name) full_name
INTO retval
FROM passenger
WHERE id_passenger = f_passenger_id
AND stop_date IS NOT NULL;
DBMS_OUTPUT.PUT_LINE('Статус: Неактивный пользователь');
RETURN retval;
EXCEPTION
WHEN NO_DATA_FOUND 
THEN 
DBMS_OUTPUT.PUT_LINE('Data is not found');
WHEN TOO_MANY_ROWS 
THEN 
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
END pkg_fullname_user;
/
DECLARE
L_NAME pkg_fullname_user.fullname_t;
pass_name pkg_fullname_user.fullname_t;
f_driver_id  driver.id_driver%type := 21;
f_passenger_id passenger.id_passenger%type := 83;
BEGIN
L_NAME := pkg_fullname_user.drv_fullname_activity(f_driver_id);
DBMS_OUTPUT.PUT_LINE('ID водителя:'||' '||f_driver_id||''||chr(10)||'Фамилия,Имя: '||L_NAME);
pass_name := pkg_fullname_user.pass_fullname_activity(f_passenger_id);
DBMS_OUTPUT.PUT_LINE('ID пассажира:'||' '||f_passenger_id||''||chr(10)||'Фамилия,Имя: '||pass_name);
END;
/
DECLARE
L_NAME pkg_fullname_user.fullname_t;
pass_name pkg_fullname_user.fullname_t;
f_driver_id  driver.id_driver%type := 39;
f_passenger_id passenger.id_passenger%type := 86;
BEGIN
L_NAME := pkg_fullname_user.drv_not_activity(f_driver_id);
DBMS_OUTPUT.PUT_LINE('ID водителя:'||' '||f_driver_id||''||chr(10)||'Фамилия,Имя: '||L_NAME);
pass_name := pkg_fullname_user.pass_not_activity(f_passenger_id);
DBMS_OUTPUT.PUT_LINE('ID пассажира:'||' '||f_passenger_id||''||chr(10)||'Фамилия,Имя: '||pass_name);
END;