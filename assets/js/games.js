function filter(){
  // get filters and cards
  genre_filter = document.getElementById('genres')
  backlog_status_filter = document.getElementById('backlog_statuses')
  cards = document.getElementById('card-container')

  // check if no filters are selected
  if (genre_filter.selectedOptions.length == 0 && backlog_status_filter.selectedOptions.length == 0) {
    for (let card of cards.children) {
      card.style.display = 'block'
    }
  }else{
    for (let card of cards.children) {
      selectedByBacklogStatus = backlog_status_filter.selectedOptions.length == 0 ? true : false
      selectedByGenre = genre_filter.selectedOptions.length == 0 ? true : false
      for (let option of genre_filter.selectedOptions) {
        if (card.classList.contains(option.value.toLowerCase())) {
          selectedByGenre = true
        }
      }
      for (let option of backlog_status_filter.selectedOptions) {
        if (card.classList.contains(option.value.toLowerCase())) {
          selectedByBacklogStatus = true
        }
      }
      if (selectedByBacklogStatus && selectedByGenre) {
        card.style.display = 'block'
      } else {
        card.style.display = 'none'
      }
    }
  }
}
