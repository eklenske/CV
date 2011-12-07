jsdom   = require 'jsdom'
util    = require 'util'
fs      = require 'fs'
hal = "http://haltools.inrialpes.fr/Public/afficheRequetePubli.php?auteur_exp=Friggeri&CB_auteur=oui&CB_titre=oui&CB_article=oui&langue=Anglais&tri_exp=annee_publi&tri_exp2=typdoc&tri_exp3=date_publi&ordre_aff=TA&Fen=Aff"

jsdom.env hal, ['http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js'], (err, window) ->
  $ = window.$
  
  types   = []
  entries = {}
  type    = null
  
  $('#res_script').children().each ->
    $this = $(this)
    
    switch this.nodeName.toLowerCase()
      when 'p'
        switch $this.attr('class')
          when 'Rubrique'
            year = $this.text()
          when 'SousRubrique'
            type = $this.text()
            if types.indexOf(type) == -1
              entries[type] = []
              types.push(type)
            
      when 'dl'
        cur   = null
        entry = {year}
        $this.children().each ->
          $this = $(this)
          switch this.nodeName.toLowerCase()
            when 'dt'
              switch $this.text().toLowerCase()
                when 'auteurs' then cur = 'authors'
                when 'détail'  then cur = 'more'
                when 'titre'   then cur = 'title'
                else cur = null
            when 'dd'
              if cur
                if cur == 'authors'
                  entry[cur] = $this.text().split(';').map((s)->s.replace(/^\s*|\s*$/g, ''))
                else
                  entry[cur] = $this.text().replace(/\[|\]/g, '')
        
        entries[type].push(entry)
  
  buf = []
  for type, items of entries
    buf.push "  \\subsection*{#{type.toLowerCase()}}"
    for entry in items
      buf.push "      \\btitle{#{entry.title}}"
      buf.push "      \\bauthors{#{entry.authors.join(', ')}}"
      buf.push "      \\bmore{#{entry.more}}"
  fs.writeFile __dirname+"/biblio.tex", buf.join('\n'), 'utf8', ->
    console.log "Generated biblio.tex"