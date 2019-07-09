$(() => {
    console.log('loaded')
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
      $(document).html('')
      let id = $(this).attr('data-id')
      fetch(`/travel_agencies/${id}.json`)
      .then(res => res.json())
      .then(r => {
        document.getElementsByTagName('body')[0].innerHTML = ''
        let newAgency = new Agency(r);           
        document.getElementsByTagName('body')[0].innerHTML += formatShow(newAgency);  
      })
    })
  
  const getAgencies = () => {
    fetch(`/travel_agencies.json`)
      .then(res => res.json())
      .then(agencies => {
        console.log(agencies)
        document.getElementsByTagName('body')[0].innerHTML = ''
         agencies.forEach(agency => {
           let newAgency = new Agency(agency);
  
           console.log(newAgency)
           document.getElementsByTagName('body')[0].innerHTML += formatIndex(newAgency);          
         })
      })
  }
  
} 



const formatIndex = (item) => {
    let agencyHtml = `
      <a href="/posts/${item.id}" data-id="${item.id}" class="show_link"><h1>${item.name}</h1></a>
    `
    return agencyHtml
  }
  
  const formatShow = (item) =>{
    let agencyHtml = `
      <h3>${item.name}</h3>
      
    `
    return agencyHtml
  }
  function Agency(agency) {
    this.id = agency.id
    this.name = agency.name 
    this.getaways = agency.getaways
};