-- Run in your Supabase project's SQL Editor.
-- Each user can only access their own journal, enforced by Row Level Security.
create table if not exists public.loyly_journals (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  revision bigint not null default 1,
  updated_at timestamptz not null default now()
);
alter table public.loyly_journals enable row level security;
revoke all on public.loyly_journals from anon;
grant select, insert, update on public.loyly_journals to authenticated;
drop policy if exists "Read own journal" on public.loyly_journals;
drop policy if exists "Create own journal" on public.loyly_journals;
drop policy if exists "Update own journal" on public.loyly_journals;
create policy "Read own journal" on public.loyly_journals for select to authenticated using ((select auth.uid()) = user_id);
create policy "Create own journal" on public.loyly_journals for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "Update own journal" on public.loyly_journals for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
