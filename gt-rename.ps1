# 启用执行策略（临时，仅当前会话有效）
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force -ErrorAction SilentlyContinue

# 目标目录（你的实际路径）
$targetPath = "E:\New_project\gtxt-stu"

# 检查目录是否存在
if (-not (Test-Path -Path $targetPath)) {
    Write-Host "❌ 错误：目标目录不存在 → $targetPath" -ForegroundColor Red
    pause
    exit
}

Write-Host "🔍 开始处理目录：$targetPath`n" -ForegroundColor Yellow

# ========== 第一步：优先处理顶层文件夹（gt-xxx） ==========
Get-ChildItem -Path $targetPath -Directory | ForEach-Object {
    # 强制解析文件夹的完整路径（解决DirectoryName为空的问题）
    $folderFullPath = $_.FullName
    $folderName = $_.Name
    $folderParentPath = Split-Path -Path $folderFullPath -Parent

    if ($folderName -match "tj") {
        $newFolderName = $folderName -replace "tj", "Wisdom"
        $newFolderFullPath = Join-Path -Path $folderParentPath -ChildPath $newFolderName
        
        try {
            # 重命名顶层gt-xxx文件夹
            Rename-Item -Path $folderFullPath -NewName $newFolderName -Force -ErrorAction Stop
            Write-Host "📁 已重命名顶层文件夹：$folderName → $newFolderName" -ForegroundColor Cyan
        }
        catch {
            Write-Host "❌ 重命名顶层文件夹失败：$folderName → 原因：$($_.Exception.Message)" -ForegroundColor Red
        }
    }
}

# ========== 第二步：递归处理所有子文件夹+文件（包括重命名后的文件夹内） ==========
Get-ChildItem -Path $targetPath -Recurse -ErrorAction SilentlyContinue | ForEach-Object {
    # 区分文件和文件夹
    if ($_.PSIsContainer) { # 处理子文件夹
        $folderFullPath = $_.FullName
        $folderName = $_.Name
        $folderParentPath = Split-Path -Path $folderFullPath -Parent

        if ($folderName -match "tj") {
            $newFolderName = $folderName -replace "tj", "Wisdom"
            $newFolderFullPath = Join-Path -Path $folderParentPath -ChildPath $newFolderName
            
            try {
                Rename-Item -Path $folderFullPath -NewName $newFolderName -Force -ErrorAction Stop
                Write-Host "📁 已重命名子文件夹：$folderFullPath → $newFolderFullPath" -ForegroundColor Cyan
            }
            catch {
                Write-Host "❌ 重命名子文件夹失败：$folderFullPath → 原因：$($_.Exception.Message)" -ForegroundColor Red
            }
        }
    }
    else { # 处理文件
        $fileFullPath = $_.FullName
        $fileName = $_.Name
        $fileParentPath = Split-Path -Path $fileFullPath -Parent

        if ($fileName -match "tj") {
            $newFileName = $fileName -replace "tj", "Wisdom"
            $newFileFullPath = Join-Path -Path $fileParentPath -ChildPath $newFileName
            
            try {
                Rename-Item -Path $fileFullPath -NewName $newFileName -Force -ErrorAction Stop
                Write-Host "📄 已重命名文件：$fileFullPath → $newFileFullPath" -ForegroundColor Green
            }
            catch {
                Write-Host "❌ 重命名文件失败：$fileFullPath → 原因：$($_.Exception.Message)" -ForegroundColor Red
            }
        }
    }
}

Write-Host "`n✅ 全部处理完成！优先重命名了顶层gt-xxx文件夹，再递归处理内部内容" -ForegroundColor Blue
pause