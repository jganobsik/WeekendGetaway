$(() =>{
handleClick()

})

const handleClick = () => {
$('.agencies').on('click', (e) =>{
    e.preventDefault()
    fetch('/travel_agencies.json')
    .then(r => r.json())
    .then(resp => console.log(resp))

})

}