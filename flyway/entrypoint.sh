#!/bin/bash

set -e

# Get postgresql database version and trim whitespaces
DATABASE_VERSION=$(PGPASSWORD=mainnet psql --tuples-only -U postgres -h postgres.web3signer.dappnode -p 5432 -d web3signer-mainnet -c "SELECT version FROM database_version WHERE id=1;" | awk '{print $1}' | tr -d '[:space:]')

# Get the latest migration file version
LATEST_MIGRATION_VERSION=$(ls -1 /flyway/sql/ | grep -E "V[0-9]+__.*.sql$" | tail -n 1 | cut -d'_' -f1 | cut -d'V' -f2 | sed 's/^0*//' | tr -d '[:space:]')

# Ensure that either DATABASE_VERSION and LATEST_MIGRATION_VERSION are integers
if ! [[ "$DATABASE_VERSION" =~ ^[0-9]+$ ]] || ! [[ "$LATEST_MIGRATION_VERSION" =~ ^[0-9]+$ ]]; then
  echo "ERROR: could not compare database and latest migration file versions. Exiting WITHOUT DATABASE MIGRATIONS. This may result in unexpected behaviour"
  exit 0
fi

echo "Database version: $DATABASE_VERSION"
echo "Latest migration file version: $LATEST_MIGRATION_VERSION"

if [ "$DATABASE_VERSION" -ge "$LATEST_MIGRATION_VERSION" ]; then
  echo "Database version is greater or equal to the latest migration file version. Exiting..."
  exit 0
else
  echo "Latest migration file version: $LATEST_MIGRATION_VERSION"
  flyway -baselineOnMigrate="true" -baselineVersion="${DATABASE_VERSION}" -url=jdbc:postgresql://postgres.web3signer.dappnode:5432/web3signer-mainnet -user=postgres -password=mainnet -connectRetries=60 migrate
  echo "Migration completed"
  exit 0
fi
