Function Convert-Directory($dir_path) {
    Get-ChildItem $dir_path -Filter *.md | 
        ForEach-Object {
            $file_name = $_.BaseName
            $file_name_w_ext = $_.Name
            Write-Output "Converting '$file_name_w_ext'..."
            docker run --rm --volume "$(Get-Location):/data" pandoc-wkhtmltopdf `
                -s ./$file_name_w_ext `
                -f markdown `
                --css styles/$file_name.css `
                --pdf-engine=wkhtmltopdf `
                -V title:"" `
                -V geometry:margin=0.25in `
                -t html `
                -o ./output/$file_name.pdf
            Write-Output "Done converting '$file_name_w_ext'..." 
        }
}

$path = "./output"
If(!(test-path -PathType container $path))
{
    Write-Output "'Output' directory was not found, creating the directory." 
    New-Item -ItemType Directory -Path $path
}
Convert-Directory "./"