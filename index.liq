#!/usr/bin/liquidsoap

set("log.file.path","/tmp/log.log")
set("log.stdout", true)

prev = ref("")

def checker(r)
  metadata = request.metadata(r)
  print("PLAYLIST #{prev} -> #{metadata['filename']}")
  if metadata["filename"] == "" then true else
    if metadata["filename"] == !prev then false else
      prev := metadata["filename"]
      true
    end
  end
end

songlist = playlist(check_next=checker, "playlist.m3u")

#radio = mksafe(songlist)

#def update_meta(m) =
  #print(m)
  #print(songlist)
  #print("test")
#end

#radio = on_metadata(update_meta,radio)
#output.icecast(%aac,host="origin.cl.mediastre.am",port=8000,password="527mediastream", mount="mediastream.aac", genre="", url="", description="",radio)