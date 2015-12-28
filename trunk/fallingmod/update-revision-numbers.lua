-- FallingMod Revision Number Update
-- (c) PotcFdk, 2013

require('lfs')

-------------------------------------------------------------------------

--- SVN HELPERS

local svn = {}

function svn.IsValid(folder)
	for name in lfs.dir(folder) do
		if name == ".svn" then return true end
	end
	return false
end

function svn.Update(folder)
	if not svn.IsValid(folder) then return end
	os.execute([[svn up "]]..folder..[[" -q]])
end

function svn.GetRevision(folder)
	if not svn.IsValid(folder) then return end
	local handle = io.popen([[svn info "]]..folder..[["]])
	local result = handle:read("*a")
	handle:close()
	local revision = string.match(result,"Revision:%s(%d+)")
	return tonumber(revision)
end

function svn.GetHeadRevision(folder)
	if not svn.IsValid(folder) then return end
	local handle = io.popen([[svn info "]]..folder..[[" -rHEAD]])
	local result = handle:read("*a")
	handle:close()
	local revision = string.match(result,"Revision:%s(%d+)")
	return tonumber(revision)
end

function svn.NeedsUpdate(folder)
	if not svn.IsValid(folder) then return end
	local head_revision = svn.GetHeadRevision(folder)
	if not head_revision then return end
	if head_revision > svn.GetRevision(folder) then
		return true
	else
		return false
	end
end

-------------------------------------------------------------------------

--- SIMPLE UNICODE

local unicode = {}

function unicode.encode(str)
	assert(str, "parameter expected!")
	str = tostring(str)
	local out = ""
	for i=1, string.len(str) do
		out = out..string.sub(str,i,i).."\0"
	end
	return out
end

-------------------------------------------------------------------------

--- FILE WRITE

local file = {}

function file.Read(file)
	local f = io.open(file, "rb")
    --local result, mode = lfs.setmode(f, "text")
    --assert((result and mode == "text") or (not result and mode == "setmode not supported on this platform"))
	local c = f:read("*all")
    f:close()
	return c
end

function file.Write(file,data)
	local f = io.open(file, "wb")
    --local result, mode = lfs.setmode(f, "text")
    --assert((result and mode == "text") or (not result and mode == "setmode not supported on this platform"))
	f:write(data)
    f:close()
end


-------------------------------------------------------------------------
-------------------------------------------------------------------------
-------------------------------------------------------------------------

local revision = svn.GetRevision('.')
revision = revision + 1

local content

-- gameinfo.txt
content = file.Read("gameinfo.txt")
content = string.gsub(content, "= Rev. %d+ =", "= Rev. "..revision.." =")
file.Write("gameinfo.txt", content)

-- resource/fallingmod_english.txt
content = file.Read("resource/fallingmod_english.txt")
content = string.gsub(content, '".R.e.v.i.s.i.o.n. .*".', unicode.encode('"Revision '..revision..'"'))
file.Write("resource/fallingmod_english.txt", content)

-- resource/fallingmod_german.txt
content = file.Read("resource/fallingmod_german.txt")
content = string.gsub(content, '".R.e.v.i.s.i.o.n. .*".', unicode.encode('"Revision '..revision..'"'))
file.Write("resource/fallingmod_german.txt", content)

-- resource/fm_revision.res
file.Write("resource/fm_revision.res", revision)