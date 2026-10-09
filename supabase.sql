-- Botol PETku: database online tanpa login.
-- PERINGATAN: kebijakan anon di bawah membuat data dapat dibaca/diubah siapa saja
-- yang mengetahui URL proyek dan publishable key. Gunakan hanya untuk uji coba.

create table if not exists public.pet_botol_app_state (
  id integer primary key check (id = 1),
  data jsonb not null default '{"purchases":[],"productions":[],"sales":[],"deliveries":[],"assets":[]}'::jsonb,
  settings jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  updated_by uuid references auth.users(id)
);

alter table public.pet_botol_app_state enable row level security;
grant select, insert, update on public.pet_botol_app_state to anon, authenticated;

drop policy if exists "Authenticated users can read PET Botol state" on public.pet_botol_app_state;
drop policy if exists "Authenticated users can insert PET Botol state" on public.pet_botol_app_state;
drop policy if exists "Authenticated users can update PET Botol state" on public.pet_botol_app_state;
drop policy if exists "Public can read PET Botol state without login" on public.pet_botol_app_state;
drop policy if exists "Public can insert PET Botol state without login" on public.pet_botol_app_state;
drop policy if exists "Public can update PET Botol state without login" on public.pet_botol_app_state;

create policy "Public can read PET Botol state without login"
  on public.pet_botol_app_state for select to anon, authenticated using (true);
create policy "Public can insert PET Botol state without login"
  on public.pet_botol_app_state for insert to anon, authenticated with check (true);
create policy "Public can update PET Botol state without login"
  on public.pet_botol_app_state for update to anon, authenticated using (true) with check (true);
