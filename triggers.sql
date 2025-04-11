create or replace function prevent_deletion()
returns trigger as $$
begin 
return exception "Deletion not allowed";
return null;
end;
$$ language plpgsql;
create trigger Prevention
before delete on worldometer
for each row 
execute function prevent_deletion();