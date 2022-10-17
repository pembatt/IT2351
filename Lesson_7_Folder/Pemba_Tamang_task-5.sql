-- This query schedules a monthly event that deletes audit rows.
-- Created by Pemba Tamang on 10/16/22

-- Shows the variables and thier status.
SHOW VARIABLES LIKE 'event_scheduler';

-- Drops the event monthly_delete_audit_rows if it already exists.
DROP EVENT IF EXISTS monthly_delete_audit_rows;

-- Changes the default delimeter from ; to //.
Delimiter //

-- Turns on the scheduled event.
SET GLOBAL event_scheduler = ON;

-- Creates the monthly event that starts on event '2022-10-15' with the name monthly_delete_audit_rows.
Create Event monthly_delete_audit_rows
ON SCHEDULE EVERY 1 MONTH
Starts '2022-10-15'

-- Defines what happens in the event
Do Begin
-- Deletes from the invoices_audit a row every month.
	DELETE FROM invoices_audit WHERE action_date < NOW() - INTERVAL 1 MONTH ;
END//

-- Sets the delimiter back to the default ;.
Delimiter ;
	