-- scaffold geniefile for LLAIR

LLAIR_script = path.getabsolute(path.getdirectory(_SCRIPT))
LLAIR_root = path.join(LLAIR_script, "LLAIR")

LLAIR_includedirs = {
	path.join(LLAIR_script, "config"),
	LLAIR_root,
}

LLAIR_libdirs = {}
LLAIR_links = {}
LLAIR_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { LLAIR_includedirs }
	end,

	_add_defines = function()
		defines { LLAIR_defines }
	end,

	_add_libdirs = function()
		libdirs { LLAIR_libdirs }
	end,

	_add_external_links = function()
		links { LLAIR_links }
	end,

	_add_self_links = function()
		links { "LLAIR" }
	end,

	_create_projects = function()

project "LLAIR"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		LLAIR_includedirs,
	}

	defines {}

	files {
		path.join(LLAIR_script, "config", "**.h"),
		path.join(LLAIR_root, "**.h"),
		path.join(LLAIR_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
