let chartInstance = null;

// Fetch initial task data from hidden DOM elements
const fetchTaskData = () => {
  const total = parseInt(document.getElementById('total-tasks-initial-data')?.textContent) || 0;
  const completed = parseInt(document.getElementById('completed-tasks-initial-data')?.textContent) || 0;
  return { total, completed };
};

// Update the donut chart
const updateChart = (data) => {
  const remaining = data.total - data.completed;
  const ctx = document.getElementById('task-chart');
  if (!ctx) return;

  // Destroy previous chart if exists
  if (chartInstance) chartInstance.destroy();

  chartInstance = new Chart(ctx, {
    type: 'doughnut',
    data: {
      labels: ['Completed', 'Remaining'],
      datasets: [{
        data: [data.completed, remaining],
        backgroundColor: ['#4CAF50', '#FF9800'],
        hoverOffset: 4
      }]
    },
    options: {
      responsive: true,
      plugins: {
        legend: { position: 'top' },
        title: { display: true, text: `Task Progress (${data.completed} / ${data.total})` }
      }
    }
  });
};

// Initialize chart on page load
const initializeCounter = () => {
  const data = fetchTaskData();
  updateChart(data);
};

export { initializeCounter };
