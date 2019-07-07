$(() =>{
handleClick()

})

const handleClick = () => {
$('.agencies').on('click', (e) =>{
    e.preventDefault()
    history.pushState(null, null, "travel_agencies")
    fetch('/travel_agencies.json')
    .then(r => r.json())
    .then(resp => {

        $('#app-container').html('')
        resp.forEach((agency) => {
            let newAgency = new Agency(agency)
            let agencyHtml = newAgency.formatIndex()
            $('#app-container').append(agencyHtml)
        })
    })  

})
    $(document).on('click', ".show_link", (e) =>{
        e.preventDefault()
        history.pushState(null, null, "travel_agencies/${id}")
        let id = $(this).attr('data-id')
        fetch(`/travel_agencies/${id}.json`)
         .then(r => r.json())
         .then(resp => {
        $('#app-container').html('')
            let newAgency = new Agency(resp)
            let agencyHtml = newAgency.formatShow()
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
    <a href="/travel_agencies/${this.id}" class="show_link" data-id="${this.id}><h1>${this.name}</h1></a>
    `
    return agencyHtml
}

Agency.prototype.formatShow = function(){
    let agencyHtml = `
    <h1>${this.name}</h1>
    `
    return agencyHtml
}