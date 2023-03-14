
$counter=0

$a = get-childitem -path /opt/splunk/etc/apps/ -recurse *.png  

foreach($filename in $a)
    {
        if($filename.Fullname -like "*/appserver/static/*.png")
        {
            if($counter -eq 0)
                {
                    $filename | Select-Object FullName, Name, Extension  | Export-Csv -path mytest.csv 
                    $counter += 1
                }
            else 
            {
                $filename | Select-Object FullName, Name, Extension  | Export-Csv -path mytest.csv -Append
            }  
       
        }
    }
