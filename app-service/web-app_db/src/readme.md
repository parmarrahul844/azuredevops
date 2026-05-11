# Testing locally
# Run PostgreSQL container
docker run -d \
 --name attendance-db \
 -e POSTGRES_PASSWORD=password \
 -e POSTGRES_DB=mydb \
 -p 5432:5432 \
 postgres:15

# Export database connection string for localhost
export DB_LINK="postgresql://postgres:password@localhost:5432/mydb"

# Sample export database connection for web app
export DB_LINK="postgresql://nforbhbxmz:Qwerty123@stuportal-dbserver.postgres.database.azure.com:5432/mydb"

# cd to src

cd src

# Virtual env

python3 -m venv venv

source venv/bin/activate

pip install -r requirements.txt


## Building with docker bake

-login to ecr 
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 366140438193.dkr.ecr.ap-south-1.amazonaws.com

Docker buildx bake app --push 
