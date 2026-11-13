```html
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>100 Push-Ups November Challenge</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            darkMode: 'class',
            theme: {
                extend: {
                    colors: {
                        brand: {
                            50: '#f0fdf4',
                            500: '#22c55e',
                            600: '#16a34a',
                            700: '#15803d',
                        },
                        accent: {
                            500: '#3b82f6',
                            600: '#2563eb',
                        }
                    }
                }
            }
        }
    </script>
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- Canvas Confetti -->
    <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.6.0/dist/confetti.browser.min.js"></script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
            -webkit-tap-highlight-color: transparent;
        }
        .custom-scrollbar::-webkit-scrollbar {
            width: 4px;
        }
        .custom-scrollbar::-webkit-scrollbar-track {
            background: rgba(255, 255, 255, 0.05);
        }
        .custom-scrollbar::-webkit-scrollbar-thumb {
            background: rgba(255, 255, 255, 0.2);
            border-radius: 4px;
        }
    </style>
</head>
<body class="bg-slate-950 text-slate-100 min-h-screen flex flex-col justify-between pb-10">

    <!-- Header / Navbar -->
    <header class="sticky top-0 z-30 bg-slate-900/80 backdrop-blur-md border-b border-slate-800 px-4 py-3 sm:px-6">
        <div class="max-w-md mx-auto flex justify-between items-center">
            <div class="flex items-center gap-3">
                <div class="w-10 h-10 rounded-xl bg-gradient-to-tr from-emerald-500 to-teal-400 flex items-center justify-center text-slate-950 font-black shadow-lg shadow-emerald-500/20">
                    <i class="fa-solid font-bold text-lg fa-bolt"></i>
                </div>
                <div>
                    <h1 class="font-extrabold text-base sm:text-lg tracking-tight bg-gradient-to-r from-white via-slate-200 to-slate-400 bg-clip-text text-transparent">NOV 100 CHALLENGE</h1>
                    <p class="text-xs text-emerald-400 font-medium flex items-center gap-1">
                        <span class="inline-block w-2 h-2 rounded-full bg-emerald-500 animate-pulse"></span>
                        Daily Target: 100 Push-ups
                    </p>
                </div>
            </div>
            <button id="reset-btn" title="Reset Data" class="p-2 text-slate-400 hover:text-rose-400 hover:bg-slate-800 rounded-lg transition-colors">
                <i class="fa-solid fa-rotate-right text-lg"></i>
            </button>
        </div>
    </header>

    <!-- Main Container -->
    <main class="max-w-md mx-auto w-full px-4 pt-4 flex-1 flex flex-col gap-5">
        
        <!-- Catch-Up Pace Banner -->
        <div id="pace-banner" class="bg-gradient-to-r from-amber-500/10 via-emerald-500/10 to-teal-500/10 border border-amber-500/30 p-4 rounded-2xl shadow-xl flex items-center gap-3.5">
            <div class="w-10 h-10 rounded-xl bg-amber-500/20 border border-amber-500/40 flex items-center justify-center text-amber-400 shrink-0">
                <i class="fa-solid fa-calculator text-lg"></i>
            </div>
            <div class="flex-1">
                <div class="flex justify-between items-center">
                    <span class="text-[11px] font-bold uppercase tracking-wider text-amber-400">Pace Adjuster</span>
                    <span id="remaining-days-tag" class="text-[10px] font-semibold bg-amber-500/20 text-amber-300 px-2 py-0.5 rounded-full">0 days left</span>
                </div>
                <p id="pace-target-text" class="text-xs font-semibold text-slate-200 mt-0.5">
                    To hit 3,000 total, you need <span id="pace-target-count" class="text-amber-400 font-extrabold text-sm">100</span> push-ups/day starting today!
                </p>
            </div>
        </div>

        <!-- Summary Cards Grid -->
        <div class="grid grid-cols-2 gap-3">
            <!-- Monthly Progress Card -->
            <div class="bg-slate-900/90 border border-slate-800 p-4 rounded-2xl relative overflow-hidden shadow-xl">
                <div class="flex items-center justify-between mb-2">
                    <span class="text-xs font-semibold uppercase tracking-wider text-slate-400">Month Progress</span>
                    <i class="fa-solid fa-trophy text-amber-400 text-sm"></i>
                </div>
                <div class="flex items-baseline gap-1">
                    <span id="monthly-total" class="text-2xl font-black text-white">0</span>
                    <span class="text-xs text-slate-400 font-medium">/ 3000</span>
                </div>
                <div class="w-full bg-slate-800 h-2 rounded-full mt-3 overflow-hidden">
                    <div id="monthly-bar" class="bg-gradient-to-r from-emerald-500 to-teal-400 h-full rounded-full transition-all duration-500" style="width: 0%"></div>
                </div>
                <p id="remaining-total-text" class="text-[10px] text-slate-400 mt-2 font-medium">3,000 remaining</p>
            </div>

            <!-- Current Streak Card -->
            <div class="bg-slate-900/90 border border-slate-800 p-4 rounded-2xl relative overflow-hidden shadow-xl">
                <div class="flex items-center justify-between mb-2">
                    <span class="text-xs font-semibold uppercase tracking-wider text-slate-400">Current Streak</span>
                    <i class="fa-solid fa-fire text-orange-500 text-sm"></i>
                </div>
                <div class="flex items-baseline gap-1">
                    <span id="streak-count" class="text-2xl font-black text-white">0</span>
                    <span class="text-xs text-slate-400 font-medium">Days</span>
                </div>
                <p id="streak-status" class="text-[10px] text-slate-400 mt-2 font-medium">Keep hitting 100 daily!</p>
            </div>
        </div>

        <!-- Selected Day Progress Tracker Block -->
        <div class="bg-slate-900/90 border border-slate-800 p-5 rounded-3xl shadow-xl flex flex-col gap-4 relative">
            <div class="flex justify-between items-center">
                <div>
                    <h2 class="text-xs font-bold uppercase tracking-wider text-slate-400">Day Progress</h2>
                    <p id="selected-date-label" class="text-sm font-semibold text-emerald-400 mt-0.5">Today</p>
                </div>
                <div class="text-right">
                    <span id="today-total" class="text-3xl font-black text-white">0</span>
                    <span class="text-sm font-bold text-slate-400">/ 100</span>
                </div>
            </div>

            <!-- Progress Circle / Bar -->
            <div class="relative w-full bg-slate-800/80 rounded-2xl h-4 overflow-hidden border border-slate-700/50">
                <div id="today-bar" class="h-full bg-gradient-to-r from-emerald-500 to-teal-300 rounded-2xl transition-all duration-300 shadow-lg shadow-emerald-500/50" style="width: 0%"></div>
            </div>

            <!-- Quick Add Set Controls -->
            <div class="flex flex-col gap-2 mt-1">
                <span class="text-xs font-medium text-slate-400">Log Completed Set</span>
                <div class="grid grid-cols-4 gap-2">
                    <button onclick="addQuickSet(10)" class="py-2.5 bg-slate-800 hover:bg-slate-700 active:scale-95 border border-slate-700 rounded-xl font-bold text-sm text-slate-200 transition">
                        +10
                    </button>
                    <button onclick="addQuickSet(20)" class="py-2.5 bg-slate-800 hover:bg-slate-700 active:scale-95 border border-slate-700 rounded-xl font-bold text-sm text-slate-200 transition">
                        +20
                    </button>
                    <button onclick="addQuickSet(25)" class="py-2.5 bg-slate-800 hover:bg-slate-700 active:scale-95 border border-slate-700 rounded-xl font-bold text-sm text-slate-200 transition">
                        +25
                    </button>
                    <button onclick="addQuickSet(30)" class="py-2.5 bg-slate-800 hover:bg-slate-700 active:scale-95 border border-slate-700 rounded-xl font-bold text-sm text-slate-200 transition">
                        +30
                    </button>
                </div>

                <!-- Custom Input Form -->
                <form id="custom-set-form" class="flex gap-2 mt-1">
                    <input type="number" id="custom-count" placeholder="Custom count (e.g. 15)" min="1" max="500" required
                        class="flex-1 bg-slate-950 border border-slate-800 rounded-xl px-4 py-2.5 text-sm text-white placeholder-slate-500 focus:outline-none focus:border-emerald-500 transition">
                    <button type="submit" class="bg-emerald-500 hover:bg-emerald-600 active:scale-95 text-slate-950 font-bold px-5 py-2.5 rounded-xl text-sm transition flex items-center justify-center gap-1 shadow-md shadow-emerald-500/20">
                        <i class="fa-solid fa-plus"></i> Add
                    </button>
                </form>
            </div>
        </div>

        <!-- Selected Day's Log Details -->
        <div class="bg-slate-900/90 border border-slate-800 p-4 rounded-2xl shadow-xl flex flex-col gap-3">
            <div class="flex justify-between items-center">
                <h3 class="text-xs font-bold uppercase tracking-wider text-slate-400">Completed Sets (<span id="set-count-badge">0</span>)</h3>
                <span class="text-[11px] text-slate-500">Tap trash icon to remove set</span>
            </div>
            
            <div id="sets-container" class="max-h-36 overflow-y-auto custom-scrollbar flex flex-col gap-2">
                <!-- Log entries will be rendered here dynamically -->
            </div>
        </div>

        <!-- November Interactive Calendar Grid -->
        <div class="bg-slate-900/90 border border-slate-800 p-5 rounded-3xl shadow-xl flex flex-col gap-3">
            <div class="flex justify-between items-center mb-1">
                <h2 class="text-sm font-bold text-white uppercase tracking-wider flex items-center gap-2">
                    <i class="fa-regular fa-calendar-days text-emerald-400"></i> November Calendar
                </h2>
                <div class="flex items-center gap-3 text-[11px] text-slate-400">
                    <span class="flex items-center gap-1"><span class="w-2.5 h-2.5 rounded-full bg-emerald-500"></span> 100+</span>
                    <span class="flex items-center gap-1"><span class="w-2.5 h-2.5 rounded-full bg-amber-500"></span> Partial</span>
                </div>
            </div>

            <!-- Calendar Days Header -->
            <div class="grid grid-cols-7 text-center font-semibold text-xs text-slate-500 mb-1">
                <div>Sun</div>
                <div>Mon</div>
                <div>Tue</div>
                <div>Wed</div>
                <div>Thu</div>
                <div>Fri</div>
                <div>Sat</div>
            </div>

            <!-- Calendar Days Grid -->
            <div id="calendar-grid" class="grid grid-cols-7 gap-1.5">
                <!-- Days will be rendered by JS -->
            </div>
        </div>

        <!-- File Storage & Sync Section -->
        <div class="bg-slate-900/90 border border-slate-800 p-5 rounded-3xl shadow-xl flex flex-col gap-3">
            <div class="flex justify-between items-center">
                <div>
                    <h2 class="text-sm font-bold text-white uppercase tracking-wider flex items-center gap-2">
                        <i class="fa-solid fa-cloud-arrow-up text-sky-400"></i> File Sync & Backup
                    </h2>
                    <p class="text-xs text-slate-400 mt-0.5">Export data to file or import onto another device.</p>
                </div>
            </div>
            <div class="grid grid-cols-2 gap-2 mt-1">
                <button onclick="exportJSONData()" class="py-2.5 bg-slate-800 hover:bg-slate-700 active:scale-95 border border-slate-700 rounded-xl font-bold text-xs text-slate-200 transition flex items-center justify-center gap-2">
                    <i class="fa-solid fa-download text-sky-400"></i> Export to File
                </button>
                <label class="py-2.5 bg-slate-800 hover:bg-slate-700 active:scale-95 border border-slate-700 rounded-xl font-bold text-xs text-slate-200 transition flex items-center justify-center gap-2 cursor-pointer">
                    <i class="fa-solid fa-upload text-emerald-400"></i> Import File
                    <input type="file" id="json-file-input" accept=".json" onchange="importJSONData(event)" class="hidden">
                </label>
            </div>
        </div>

    </main>

    <!-- Custom Reset Modal -->
    <div id="confirm-modal" class="fixed inset-0 bg-slate-950/80 backdrop-blur-sm z-50 flex items-center justify-center p-4 hidden">
        <div class="bg-slate-900 border border-slate-800 rounded-2xl p-5 max-w-xs w-full flex flex-col gap-4 shadow-2xl">
            <div class="flex items-center gap-3 text-rose-400">
                <i class="fa-solid fa-triangle-exclamation text-2xl"></i>
                <h3 class="font-bold text-lg text-white">Reset All Progress?</h3>
            </div>
            <p class="text-xs text-slate-400">This will delete all logged push-up sets for November. This action cannot be undone.</p>
            <div class="flex gap-2">
                <button id="cancel-reset" class="flex-1 py-2 bg-slate-800 hover:bg-slate-700 text-slate-300 font-semibold text-sm rounded-xl transition">Cancel</button>
                <button id="confirm-reset" class="flex-1 py-2 bg-rose-600 hover:bg-rose-700 text-white font-semibold text-sm rounded-xl transition">Reset</button>
            </div>
        </div>
    </div>

    <!-- JavaScript Logic -->
    <script>
        // Data Key
        const STORAGE_KEY = 'nov_pushup_challenge_2026';
        let trackerData = JSON.parse(localStorage.getItem(STORAGE_KEY)) || {};
        
        // Default selected date: today (Formatted YYYY-MM-DD)
        let selectedDate = getFormattedDate(new Date());

        // DOM Element Refs
        const calendarGrid = document.getElementById('calendar-grid');
        const todayTotalEl = document.getElementById('today-total');
        const todayBarEl = document.getElementById('today-bar');
        const monthlyTotalEl = document.getElementById('monthly-total');
        const monthlyBarEl = document.getElementById('monthly-bar');
        const remainingTotalText = document.getElementById('remaining-total-text');
        const streakCountEl = document.getElementById('streak-count');
        const streakStatusEl = document.getElementById('streak-status');
        const selectedDateLabel = document.getElementById('selected-date-label');
        const setsContainer = document.getElementById('sets-container');
        const setCountBadge = document.getElementById('set-count-badge');
        const customSetForm = document.getElementById('custom-set-form');
        const customCountInput = document.getElementById('custom-count');
        const resetBtn = document.getElementById('reset-btn');
        const confirmModal = document.getElementById('confirm-modal');
        const cancelResetBtn = document.getElementById('cancel-reset');
        const confirmResetBtn = document.getElementById('confirm-reset');
        
        // Pace calculation refs
        const paceTargetCountEl = document.getElementById('pace-target-count');
        const paceTargetTextEl = document.getElementById('pace-target-text');
        const remainingDaysTagEl = document.getElementById('remaining-days-tag');

        // Helper: Format Date to YYYY-MM-DD
        function getFormattedDate(d) {
            const year = d.getFullYear();
            const month = String(d.getMonth() + 1).padStart(2, '0');
            const day = String(d.getDate()).padStart(2, '0');
            return `${year}-${month}-${day}`;
        }

        // Initialize Application
        function initApp() {
            renderCalendar();
            renderSelectedDayData();
            updateMonthlyStats();
            setupEventListeners();
        }

        // Event Listeners setup
        function setupEventListeners() {
            customSetForm.addEventListener('submit', (e) => {
                e.preventDefault();
                const count = parseInt(customCountInput.value);
                if (count > 0) {
                    addPushUpSet(count);
                    customCountInput.value = '';
                }
            });

            resetBtn.addEventListener('click', () => {
                confirmModal.classList.remove('hidden');
            });

            cancelResetBtn.addEventListener('click', () => {
                confirmModal.classList.add('hidden');
            });

            confirmResetBtn.addEventListener('click', () => {
                trackerData = {};
                saveData();
                confirmModal.classList.add('hidden');
                updateAllUI();
            });
        }

        // Save to Local Storage
        function saveData() {
            localStorage.setItem(STORAGE_KEY, JSON.stringify(trackerData));
        }

        // Add a push-up set
        function addQuickSet(count) {
            addPushUpSet(count);
        }

        function addPushUpSet(count) {
            if (!trackerData[selectedDate]) {
                trackerData[selectedDate] = [];
            }

            const previousTotal = getDayTotal(selectedDate);
            
            const newSet = {
                id: Date.now().toString(),
                count: count,
                time: new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })
            };

            trackerData[selectedDate].push(newSet);
            saveData();
            
            const newTotal = getDayTotal(selectedDate);

            // Trigger confetti if daily goal hit (100) for the first time today
            if (previousTotal < 100 && newTotal >= 100) {
                triggerConfetti();
            }

            updateAllUI();
        }

        // Delete specific set
        function deleteSet(setId) {
            if (!trackerData[selectedDate]) return;

            trackerData[selectedDate] = trackerData[selectedDate].filter(s => s.id !== setId);
            if (trackerData[selectedDate].length === 0) {
                delete trackerData[selectedDate];
            }
            saveData();
            updateAllUI();
        }

        // Calculate Total for specific day
        function getDayTotal(dateStr) {
            if (!trackerData[dateStr]) return 0;
            return trackerData[dateStr].reduce((sum, set) => sum + set.count, 0);
        }

        // Render Calendar Grid for November (30 Days)
        function renderCalendar() {
            calendarGrid.innerHTML = '';
            
            const year = new Date().getFullYear();
            const novFirst = new Date(year, 10, 1); // Nov is Month index 10
            const startingDayOfWeek = novFirst.getDay(); // 0 (Sun) - 6 (Sat)
            const todayStr = getFormattedDate(new Date());

            // Render Empty slots for start of week padding
            for (let i = 0; i < startingDayOfWeek; i++) {
                const emptyCell = document.createElement('div');
                emptyCell.className = 'h-11 rounded-xl bg-slate-900/40 opacity-20';
                calendarGrid.appendChild(emptyCell);
            }

            // Render 30 Days of November
            for (let day = 1; day <= 30; day++) {
                const dayStr = `${year}-11-${String(day).padStart(2, '0')}`;
                const total = getDayTotal(dayStr);
                const isSelected = dayStr === selectedDate;
                const isToday = dayStr === todayStr;

                const dayCard = document.createElement('button');
                dayCard.onclick = () => selectDate(dayStr);
                
                // Base styling
                let bgClass = 'bg-slate-950 border-slate-800 text-slate-300';
                let indicatorColor = '';

                if (total >= 100) {
                    bgClass = 'bg-emerald-950/60 border-emerald-500/40 text-emerald-300';
                    indicatorColor = 'bg-emerald-500';
                } else if (total > 0) {
                    bgClass = 'bg-amber-950/40 border-amber-500/30 text-amber-300';
                    indicatorColor = 'bg-amber-500';
                }

                if (isSelected) {
                    bgClass += ' ring-2 ring-emerald-400 ring-offset-2 ring-offset-slate-950';
                }

                dayCard.className = `h-11 rounded-xl border flex flex-col items-center justify-between p-1 relative transition-all active:scale-95 ${bgClass}`;

                dayCard.innerHTML = `
                    <div class="w-full flex justify-between items-center px-1">
                        <span class="text-[11px] font-bold ${isToday ? 'text-emerald-400 font-extrabold' : ''}">${day}</span>
                        ${total > 0 ? `<span class="w-1.5 h-1.5 rounded-full ${indicatorColor}"></span>` : ''}
                    </div>
                    <span class="text-[10px] font-semibold opacity-90">${total > 0 ? total : ''}</span>
                `;

                calendarGrid.appendChild(dayCard);
            }
        }

        // Select Date handler
        function selectDate(dateStr) {
            selectedDate = dateStr;
            updateAllUI();
        }

        // Render data for currently selected day
        function renderSelectedDayData() {
            const todayStr = getFormattedDate(new Date());
            
            if (selectedDate === todayStr) {
                selectedDateLabel.innerText = "Today";
            } else {
                const d = new Date(selectedDate + 'T00:00:00');
                selectedDateLabel.innerText = d.toLocaleDateString('en-US', { month: 'short', day: 'numeric' });
            }

            const total = getDayTotal(selectedDate);
            todayTotalEl.innerText = total;

            // Update Progress Bar
            const percentage = Math.min(Math.round((total / 100) * 100), 100);
            todayBarEl.style.width = `${percentage}%`;

            // Render Sets Log
            const sets = trackerData[selectedDate] || [];
            setCountBadge.innerText = sets.length;

            if (sets.length === 0) {
                setsContainer.innerHTML = `
                    <div class="text-center py-6 text-xs text-slate-500 font-medium">
                        No sets logged for this date.
                    </div>
                `;
            } else {
                setsContainer.innerHTML = sets.slice().reverse().map(set => `
                    <div class="flex items-center justify-between bg-slate-950 border border-slate-800/80 px-3 py-2 rounded-xl">
                        <div class="flex items-center gap-3">
                            <span class="font-extrabold text-sm text-emerald-400">+${set.count}</span>
                            <span class="text-xs text-slate-400 font-medium">push-ups</span>
                        </div>
                        <div class="flex items-center gap-3">
                            <span class="text-[11px] text-slate-500 font-mono">${set.time}</span>
                            <button onclick="deleteSet('${set.id}')" class="text-slate-500 hover:text-rose-400 p-1 transition">
                                <i class="fa-solid fa-trash-can text-xs"></i>
                            </button>
                        </div>
                    </div>
                `).join('');
            }
        }

        // Calculate Monthly Overall Stats and Streaks
        function updateMonthlyStats() {
            let totalPushups = 0;
            const year = new Date().getFullYear();

            // Calculate overall total for November
            for (let day = 1; day <= 30; day++) {
                const dayStr = `${year}-11-${String(day).padStart(2, '0')}`;
                totalPushups += getDayTotal(dayStr);
            }

            monthlyTotalEl.innerText = totalPushups;
            const remainingPushups = Math.max(0, 3000 - totalPushups);
            remainingTotalText.innerText = `${remainingPushups.toLocaleString()} push-ups remaining`;

            const monthlyPercentage = Math.min(Math.round((totalPushups / 3000) * 100), 100);
            monthlyBarEl.style.width = `${monthlyPercentage}%`;

            // Calculate Dynamic Pace Target
            const now = new Date();
            const todayDayNum = now.getDate(); // 1-30
            // Remaining days in November including today
            const remainingDays = Math.max(1, 30 - todayDayNum + 1);
            remainingDaysTagEl.innerText = `${remainingDays} ${remainingDays === 1 ? 'day' : 'days'} left`;

            if (remainingPushups <= 0) {
                paceTargetTextEl.innerHTML = `<span class="text-emerald-400 font-extrabold">Challenge Complete! 🎉</span> You reached 3,000 push-ups!`;
            } else {
                const requiredPace = Math.ceil(remainingPushups / remainingDays);
                paceTargetCountEl.innerText = requiredPace;
            }

            // Calculate Streak (Consecutive days >= 100)
            let streak = 0;
            const today = new Date();
            let checkDate = new Date(today);

            while (true) {
                const dateStr = getFormattedDate(checkDate);
                const dayTotal = getDayTotal(dateStr);

                if (dayTotal >= 100) {
                    streak++;
                    checkDate.setDate(checkDate.getDate() - 1);
                } else {
                    // Check if today is incomplete yet, allow previous days to maintain streak
                    if (dateStr === getFormattedDate(today)) {
                        checkDate.setDate(checkDate.getDate() - 1);
                        continue;
                    }
                    break;
                }
            }

            streakCountEl.innerText = streak;
            streakStatusEl.innerText = streak > 0 ? `${streak} day streak! Keep it going!` : 'Hit 100 push-ups to start streak!';
        }

        // Export data to JSON file
        function exportJSONData() {
            const dataStr = "data:text/json;charset=utf-8," + encodeURIComponent(JSON.stringify(trackerData, null, 2));
            const anchor = document.createElement('a');
            anchor.setAttribute("href", dataStr);
            anchor.setAttribute("download", `pushups_nov_backup_${getFormattedDate(new Date())}.json`);
            document.body.appendChild(anchor);
            anchor.click();
            anchor.remove();
        }

        // Import data from JSON file
        function importJSONData(event) {
            const file = event.target.files[0];
            if (!file) return;

            const reader = new FileReader();
            reader.onload = function(e) {
                try {
                    const importedData = JSON.parse(e.target.result);
                    if (typeof importedData === 'object' && importedData !== null) {
                        trackerData = importedData;
                        saveData();
                        updateAllUI();
                        alert('Data successfully imported from file!');
                    } else {
                        alert('Invalid data file structure.');
                    }
                } catch (err) {
                    alert('Failed to parse file. Make sure it is a valid .json file.');
                }
            };
            reader.readAsText(file);
        }

        // Master UI update function
        function updateAllUI() {
            renderCalendar();
            renderSelectedDayData();
            updateMonthlyStats();
        }

        // Confetti Celebration
        function triggerConfetti() {
            if (typeof confetti === 'function') {
                confetti({
                    particleCount: 80,
                    spread: 60,
                    origin: { y: 0.7 }
                });
            }
        }

        // Run Init
        window.onload = initApp;
    </script>
</body>
</html>
```