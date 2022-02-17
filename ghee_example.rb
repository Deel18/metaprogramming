require "ghee"

gh = Ghee.basic_auth("usr", "pwd") # Use your github username and password
all_gists = gh.users("nusco").gists
a_gist = all_gists[20]

a_gist.url          # => "https://api.github.com/gists/535077"
a_gist.description  # => "Spell: Dynamic Proxy"

a_gist.star

