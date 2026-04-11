function filterItems(){
  const backlog_status_filters = Array.from(document.querySelectorAll('input.backlog_status-filter[type="checkbox"]:checked')).map(cb => cb.dataset.filter);
  const genre_filters = Array.from(document.querySelectorAll('input.genre-filter[type="checkbox"]:checked')).map(cb => cb.dataset.filter);
  const cards = document.querySelectorAll('.card');
  cards.forEach(card => {
      let backlog_status_filter_selected = backlog_status_filters.length == 0 ? true : false
      let genre_filter_selected = genre_filters.length == 0 ? true : false
      for (let filter of backlog_status_filters) {
        if (card.classList.contains(filter)) {
          backlog_status_filter_selected = true
        }
      }
      for (let filter of genre_filters) {
        if (card.classList.contains(filter)) {
          genre_filter_selected = true
        }
      }
      card.style.display = genre_filter_selected && backlog_status_filter_selected ? 'block':'none'
    });

}

function setAll(state) {
    document.querySelectorAll('input[type="checkbox"]').forEach(cb => cb.checked = state);
    filterItems();
}
