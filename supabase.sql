-- Jalankan sekali di Supabase Dashboard > SQL Editor.
-- Semua akun yang dibuat admin dan berhasil login dapat mengakses data usaha bersama.
-- Matikan public signups di Authentication settings dan buat akun hanya untuk pengguna tepercaya.

create table if not exists public.pet_botol_app_state (
  id integer primary key check (id = 1),
  data jsonb not null default '{"purchases":[],"productions":[],"sales":[],"deliveries":[],"assets":[]}'::jsonb,
  settings jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  updated_by uuid references auth.users(id)
);

alter table public.pet_botol_app_state enable row level security;
revoke all on public.pet_botol_app_state from anon;
grant select, insert, update on public.pet_botol_app_state to authenticated;

drop policy if exists "Authenticated users can read PET Botol state" on public.pet_botol_app_state;
create policy "Authenticated users can read PET Botol state"
  on public.pet_botol_app_state for select to authenticated using (true);

drop policy if exists "Authenticated users can insert PET Botol state" on public.pet_botol_app_state;
create policy "Authenticated users can insert PET Botol state"
  on public.pet_botol_app_state for insert to authenticated with check (true);

drop policy if exists "Authenticated users can update PET Botol state" on public.pet_botol_app_state;
create policy "Authenticated users can update PET Botol state"
  on public.pet_botol_app_state for update to authenticated using (true) with check (true);
