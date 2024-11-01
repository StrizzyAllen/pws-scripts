Connect-MgGraph

$userId = "be27d9dd-bb37-4242-9d3c-42f3d56ec74b"
$groupIds = @("bc17c961-b025-4bb3-bdda-2b5e87178838", "fc783e10-3f6b-4970-8d7a-5e55f21b2bce", "b58b1d4b-2d65-4424-adbc-89150dd3cec9", "5d36de56-e8eb-401f-a394-f018d6c4ebe0","3c8c5960-af02-4a3c-a4f4-9da174cff01e", "76f70fca-b63f-4664-8806-1d354af6a9a3")

foreach ($groupId in $groupIds) {
    try {
        New-MgGroupMember -GroupId $groupId -DirectoryObjectId $userId
        Write-Host "Added $userId to $groupId"
   } catch {
        Write-Host "Failed to add user"
    }
}


Disconnect-MgGraph
