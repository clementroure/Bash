readarray -t tab < prices.txt

i=0
tot=0

moy=0
min=1000000
max=0

for n in "${tab[@]}"
do
        i=$(($i + 1))
        tot=$(($tot + $n))
        if(($n < min)); then
             min=$n
        fi
        if(($n > max)); then
            max=$n
        fi
done

moy=$(($tot / $i))
echo "average: $moy"
echo "min: $min"
echo "max: $max"
volatility=$(echo ${tab[@]} | awk 'NF {sum=0;ssq=0;for (i=1;i<=NF;i++){sum+=$i;ssq+=$i**2}; print (ssq/NF-(sum/NF)**2)**0.5}' | cut -d ":" -f1)
echo "ecart-type: $volatility"

function send(){

        telegram_api_url=$(head -n 1 telegram_api_url.txt)
        date_now="$(date +'%d/%m/%Y')"
        curl -s "$telegram_api_url&text=Bitcoin%20report%20of%20$date_now:%08average price:%20$moy%08min%20price:%20$min%08max%20price:%20$max$%08volatility:%20$volatility"
}

send