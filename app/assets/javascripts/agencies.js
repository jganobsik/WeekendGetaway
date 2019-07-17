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
    
    $('.new_agency').on('click', e => {
        e.preventDefault()
        history.pushState(null, null, "travel_agencies/new")
        document.getElementsByTagName('body')[0].innerHTML = ''
        let newAgencyForm = renderAgencyForm()
 
        document.getElementsByTagName('body')[0].innerHTML += newAgencyForm; 
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

  const renderAgencyForm = () => {
    return (`
    <strong>Register a New Agency</strong>
      <br>
			<form action="/travel_agencies" method="POST">
				<input id='name' type='text' name='name'></input><br>
				<input type='submit' />
			</form>
		`)

  }
  
} 



const formatIndex = (item) => {
    let agencyHtml = `
      <a href="/travel_agencies/${item.id}" data-id="${item.id}" class="show_link"><h1>${item.name}</h1></a>
    `
    return agencyHtml
  }
  
  const formatShow = (item) =>{
    let agencyHtml = `
      <h3>${item.name}</h3>

      
    `
     item.getaways.forEach(getaway => {
        getawayDiv = `
        <br>
        <a href="/getaways/${item.id} data-id="${item.id}" class="show_getaway"> <div>${getaway.title}</div></a>
        <br>
        `
        agencyHtml += getawayDiv
    })
    return agencyHtml
  }
  function Agency(agency) {
    this.id = agency.id
    this.name = agency.name 
    this.getaways = agency.getaways
};


const postAgency = (url = `/travel_agencies.json`, data) => {

return fetch(url, {
    method: 'POST', 
    headers: {
        'Content-Type': 'application/json',
       
    },
   
    body: JSON.stringify(data), 
})
.then(response => response.json() ) }
