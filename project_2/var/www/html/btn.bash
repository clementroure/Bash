function saveToSQL(){

    database="test"
    date_now="$(date +'%d/%m/%Y')"
    PGPASSWORD='fez54f5ezf' psql -U postgres -d $database -c "INSERT INTO public.threshold VALUES ($limit  ,$date_now)"
}

limit = $1
echo $limit
saveToSQL