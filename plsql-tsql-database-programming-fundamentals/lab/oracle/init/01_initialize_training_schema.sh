#!/usr/bin/env bash
set -euo pipefail

sqlplus -s "${APP_USER}/${APP_USER_PASSWORD}@//localhost:1521/FREEPDB1" <<'SQL'
WHENEVER SQLERROR EXIT SQL.SQLCODE
SET ECHO ON
SET DEFINE OFF
@/training/init/sql/01_schema.sql
@/training/init/sql/02_program_units.sql
@/training/init/sql/03_seed_data.sql
@/training/init/sql/99_verify.sql
EXIT
SQL
