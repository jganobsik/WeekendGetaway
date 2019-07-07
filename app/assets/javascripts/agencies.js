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
$(".show_link").on('click', (e) =>
e.preventDefault()
$('#app-container').html('')
)
}

function Agency(agency) {
    this.id = agency.id
    this.name = agency.name 
    this.getaways = agency.getaways
}

Agency.prototype.formatIndex = function(){
    let agencyHtml = `
    <a href="/travel_agencies/${this.id}" class="show_link"></a><h1>${this.name}</h1></a>
    `
    return agencyHtml
}