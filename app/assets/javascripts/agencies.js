$(() => {
    bindClickHandlers()
  })
  
  const bindClickHandlers = () => {
    $('.agencies').on('click', e => {
      e.preventDefault()
      history.pushState(null, null, "travel_agencies")
      getAgencies()
  
    })
  
    $(document).on('click', ".show_link", function(e) {
      e.preventDefault()
      $('#').html('')
      let id = $(this).attr('data-id')
      fetch(`/travel_agencies/${id}.json`)
      .then(res => res.json())
      .then(r => {
        let newAgency = new Agency(r)
        let agencyHtml = newAgency.formatShow()
  
        $('#app-container').append(agencyHtml)
      })
    })
  
    
  
  const getAgencies = () => {
    fetch(`/travel_agencies.json`)
      .then(res => res.json())
      .then(agencies => {
         $('#app-container').html('')
         agencies.forEach(agency => {
           let newAgency = new Agency(agency)
  
           let agencyHtml = newAgency.formatIndex()
  
           $('#app-container').append(agencyHtml)
         })
      })
  }
  
  function Agency(agency) {
    this.id = agency.id
    this.name = agency.name 
    this.getaways = agency.getaways
}
  
  Agency.prototype.formatIndex = function(){
    let agencyHtml = `
      <a href="/posts/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.name}</h1></a>
    `
    return agencyHtml
  }
  
  Agency.prototype.formatShow = function(){
    let agencyHtml = `
      <h3>${this.name}</h3>
      
    `
    return agencyHtml
  }
} 