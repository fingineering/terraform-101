terraform {
  // declare required provides
  required_providers {
    local = {
        source = "hashicorp/local"
        version = ">=2.2.2"
    }
    curl = {
      source = "anschoewe/curl"
      version = "1.0.2"
    }
  }
}

// configure perviously declared providers
provider "local" {
}
provider "curl" {
  
}

resource "local_file" "foo" {
  content = "Cta optimize for unning this proposal is a win-win situation which will cause a stellar paradigm shift, and produce a multi-fold increase in deliverables personal development we want to see more charts. Market-facing cannibalize. Quick win hard stop, yet on your plate, for we need to aspirationalise our offerings. Put a record on and see who dances we've got to manage that low hanging fruit or forcing function powerPointless. Action item. Innovation is hot right now increase the resolution, scale it up we need a larger print for it just needs more cowbell. Bottleneck mice proceduralize, or price point work, we need distributors to evangelize the new line to local markets, or locked and loaded idea shower. Personal development this vendor is incompetent we don't need to boil the ocean here quick win identify pain points. Root-and-branch review no scraps hit the floor, nor the horse is out of the barn. Introduccion. Let's pressure test this. Note for the previous submit: the devil should be on the left shoulder blue money, but first-order optimal strategies. But what's the real problem we're trying to solve here? reach out, nor move the needle game plan knowledge process outsourcing cadence nor no need to talk to users, just base it on the space calculator. Moving the goalposts prethink we need this overall to be busier and more active feature creep, for weaponize the data. Show pony target rich environment for we need to aspirationalise our offerings i have a hard stop in an hour and half vertical integration we need to aspirationalise our offerings. Can I just chime in on that one please use 'solutionise' instead of solution ideas! :) action item. Target rich environment this is meaningless but cadence loop back groom the backlog table the discussion . "
  filename = "${path.module}/foo/bar.baz"
}

// locale ip 
data "curl" "myip" {
    http_method = "GET"
    uri = "https://api.ipify.org"
}
locals {
  my_ip  = data.curl.myip.response
}

output "my_ip" {
  value = local.my_ip
}