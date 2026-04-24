-- High-End Programm Setup / Policies

alter table employees add column if not exists email text;
alter table employees add column if not exists role text default 'user';
alter table employees add column if not exists active boolean default true;

update employees set active = true where active is null;

-- Deinen Mitarbeiter als Admin setzen (Name ggf. anpassen)
update employees
set role = 'admin',
    email = 'kevin.kurtaj@moebel-inhofer.de',
    active = true
where name ilike '%Kevin%';

create table if not exists password_reset_activity (
  id bigint generated always as identity primary key,
  user_id uuid,
  email text,
  status text,
  details text,
  created_at timestamptz default now()
);

alter table vehicles enable row level security;
alter table damages enable row level security;
alter table damage_images enable row level security;
alter table damage_history enable row level security;
alter table vehicle_history enable row level security;
alter table employees enable row level security;
alter table password_reset_activity enable row level security;

drop policy if exists "read vehicles" on vehicles;
create policy "read vehicles" on vehicles for select to anon, authenticated using (true);
drop policy if exists "update vehicles" on vehicles;
create policy "update vehicles" on vehicles for update to authenticated using (true) with check (true);

drop policy if exists "read damages" on damages;
create policy "read damages" on damages for select to anon, authenticated using (true);
drop policy if exists "insert damages" on damages;
create policy "insert damages" on damages for insert to authenticated with check (true);
drop policy if exists "update damages" on damages;
create policy "update damages" on damages for update to authenticated using (true) with check (true);

drop policy if exists "read damage_images" on damage_images;
create policy "read damage_images" on damage_images for select to anon, authenticated using (true);
drop policy if exists "insert damage_images" on damage_images;
create policy "insert damage_images" on damage_images for insert to authenticated with check (true);

drop policy if exists "read damage_history" on damage_history;
create policy "read damage_history" on damage_history for select to anon, authenticated using (true);
drop policy if exists "insert damage_history" on damage_history;
create policy "insert damage_history" on damage_history for insert to authenticated with check (true);

drop policy if exists "read vehicle_history" on vehicle_history;
create policy "read vehicle_history" on vehicle_history for select to anon, authenticated using (true);
drop policy if exists "insert vehicle_history" on vehicle_history;
create policy "insert vehicle_history" on vehicle_history for insert to authenticated with check (true);

drop policy if exists "read employees" on employees;
create policy "read employees" on employees for select to anon, authenticated using (true);
drop policy if exists "insert employees" on employees;
create policy "insert employees" on employees for insert to authenticated with check (true);
drop policy if exists "update employees" on employees;
create policy "update employees" on employees for update to authenticated using (true) with check (true);

drop policy if exists "insert password reset activity" on password_reset_activity;
create policy "insert password reset activity" on password_reset_activity for insert to anon, authenticated with check (true);
drop policy if exists "read password reset activity" on password_reset_activity;
create policy "read password reset activity" on password_reset_activity for select to authenticated using (true);
