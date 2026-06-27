# Task Tracker — Übersicht widget
# Matches Figma design: https://www.figma.com/design/DMDOBDJoz6y8dEQuFIVfka/Untitled?node-id=1-9

refreshFrequency: false

style: '''
  top: 20px
  left: 20px
  font-family: -apple-system, "Helvetica Neue", Helvetica, sans-serif

  * { box-sizing: border-box; }

  .tt-card {
    width: 280px;
    background: transparent;
    border-radius: 12px;
    padding: 8px;
    display: flex;
    flex-direction: column;
    gap: 10px;
  }

  .tt-header {
    display: flex;
    align-items: center;
    justify-content: flex-start;
    gap: 10px;
    padding: 6px 0 2px;
  }

  .tt-title {
    font-family: 'Lora', Georgia, serif;
    font-weight: 700;
    font-size: 32px;
    color: #ffffff;
    text-shadow: 0px 1px 4px rgba(0,0,0,0.25);
  }

  .tt-day-nav {
    display: flex;
    align-items: center;
    gap: 4px;
    flex-shrink: 0;
  }

  .tt-day-arrow {
    width: 18px; height: 18px;
    border: none;
    background: transparent;
    cursor: pointer;
    padding: 0;
    color: #ffffff;
    opacity: 0.9;
    flex-shrink: 0;
    transition: opacity 0.15s;
  }
  .tt-day-arrow:hover { opacity: 1; }
  .tt-day-arrow svg { display: block; width: 100%; height: 100%; }

  .tt-day-today {
    border: none;
    background: rgba(255,255,255,0.25);
    border-radius: 100px;
    padding: 3px 10px;
    min-width: 56px;
    font-size: 10px;
    font-weight: 500;
    letter-spacing: 0.03em;
    color: #ffffff;
    cursor: pointer;
    flex-shrink: 0;
    white-space: nowrap;
    transition: background 0.15s;
  }
  .tt-day-today:hover { background: rgba(255,255,255,0.4); }

  .tt-header-add-btn {
    width: 20px; height: 20px;
    border-radius: 50%;
    border: none;
    background: #ffffff;
    color: #8a7866;
    font-size: 14px;
    line-height: 1;
    cursor: pointer;
    flex-shrink: 0;
    padding: 0;
    transition: transform 0.15s ease;
  }
  .tt-header-add-btn:hover { transform: scale(1.08); }
  .tt-header-add-btn.open { transform: rotate(45deg); }

  .tt-header-spacer { flex: 1; }

  .tt-pill-wrap {
    position: relative;
  }
  .tt-pill-wrap::after {
    content: '';
    position: absolute;
    top: 0; right: 0; bottom: 4px;
    width: 24px;
    background: linear-gradient(to right, rgba(190,168,154,0), rgba(190,168,154,1));
    pointer-events: none;
  }

  .tt-pill-row {
    display: flex;
    flex-wrap: nowrap;
    align-items: center;
    overflow-x: auto;
    overflow-y: visible;
    gap: 6px;
    padding: 2px 2px 4px;
    scrollbar-width: none;
  }
  .tt-pill-row::-webkit-scrollbar { display: none; }

  .tt-pill {
    flex-shrink: 0;
    border: none;
    border-radius: 100px;
    padding: 4px 10px;
    font-family: 'Lora', Georgia, serif;
    font-weight: 500;
    font-style: italic;
    font-size: 10px;
    cursor: pointer;
    background: rgba(255,255,255,0.55);
    color: #000000;
    text-shadow: 0px 1px 1px rgba(0,0,0,0.15);
    opacity: 0.65;
    transition: opacity 0.15s, transform 0.1s;
  }
  .tt-pill:hover { opacity: 0.9; }
  .tt-pill.active { opacity: 1; box-shadow: 0 0 0 1.5px rgba(255,255,255,0.8); }

  .tt-pill.pill-all { background: #ffffff; color: #000000; }

  .tt-list {
    display: flex;
    flex-direction: column;
    gap: 8px;
  }

  .tt-row {
    background: #ffffff;
    border: 1px solid #ffffff;
    border-radius: 100px;
    box-shadow: 0px 1px 3px 0px rgba(0,0,0,0.25);
    height: 32px;
    padding: 8px;
    display: flex;
    align-items: center;
    gap: 10px;
    overflow: hidden;
  }

  .tt-checkbox {
    width: 16px; height: 16px;
    border-radius: 50%;
    border: 1.5px solid #c9c2bb;
    background: #ffffff;
    flex-shrink: 0;
    cursor: pointer;
    padding: 0;
    position: relative;
  }
  .tt-checkbox.done {
    background: #8a7866;
    border-color: #8a7866;
  }
  .tt-checkbox.done::after {
    content: '';
    position: absolute;
    left: 4px; top: 1px;
    width: 4px; height: 8px;
    border: solid #ffffff;
    border-width: 0 1.5px 1.5px 0;
    transform: rotate(45deg);
  }

  .tt-category {
    background: #edd7d7;
    border-radius: 50%;
    width: 12px;
    height: 12px;
    padding: 0;
    font-family: 'Lora', Georgia, serif;
    font-weight: 500;
    font-style: italic;
    font-size: 10px;
    color: #000000;
    white-space: nowrap;
    text-shadow: 0px 1px 1px rgba(0,0,0,0.2);
    display: inline-flex;
    align-items: center;
    overflow: hidden;
    flex-shrink: 0;
    transition: width 0.2s ease, padding 0.2s ease, border-radius 0.2s ease;
  }
  .tt-category.expanded {
    border-radius: 100px;
    padding: 4px 8px;
  }
  .tt-category-label {
    opacity: 0;
    transition: opacity 0.12s ease;
  }
  .tt-category.expanded .tt-category-label {
    opacity: 1;
    transition-delay: 0.06s;
  }

  .tt-text {
    flex: 1;
    min-width: 0;
    font-size: 12px;
    color: #000000;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  .tt-text.done {
    text-decoration: line-through;
    color: #8a8278;
  }
  .tt-text.overdue {
    color: #c0392b;
  }
  .tt-text:hover {
    background: rgba(0,0,0,0.05);
    border-radius: 4px;
  }

  .tt-edit-input {
    flex: 1;
    min-width: 0;
    font-size: 12px;
    color: #000000;
    border: 1px solid #c9c2bb;
    border-radius: 4px;
    padding: 0 4px;
    outline: none;
    font-family: -apple-system, "Helvetica Neue", Helvetica, sans-serif;
  }

  .tt-time-label {
    flex-shrink: 0;
    font-size: 10px;
    color: #8a8278;
    white-space: nowrap;
  }

  .tt-row-actions {
    flex-shrink: 0;
    display: flex;
    align-items: center;
    gap: 2px;
    max-width: 0;
    overflow: hidden;
    opacity: 0;
    transition: opacity 0.15s, max-width 0.15s;
  }
  .tt-row:hover .tt-row-actions {
    max-width: 50px;
    opacity: 1;
  }

  .tt-remove,
  .tt-next-day {
    flex-shrink: 0;
    border: none;
    background: transparent;
    color: #b0a89c;
    cursor: pointer;
    font-size: 14px;
    line-height: 1;
    padding: 0 2px;
  }
  .tt-next-day svg { display: block; width: 14px; height: 14px; }
  .tt-next-day:hover, .tt-remove:hover { color: #8a7866; }

  .tt-bottom-row {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
  }

  .tt-clear-btn {
    border: none;
    border-radius: 100px;
    background: rgba(255,255,255,0.55);
    color: #6b5f50;
    cursor: pointer;
    padding: 5px 14px;
    font-size: 11px;
    font-weight: 500;
    letter-spacing: 0.02em;
    flex-shrink: 0;
    transition: background 0.15s, color 0.15s;
  }
  .tt-clear-btn:hover {
    background: #8a7866;
    color: #ffffff;
  }

  .tt-settings-btn {
    width: 22px; height: 22px;
    border: none;
    border-radius: 50%;
    background: rgba(255,255,255,0.55);
    color: #6b5f50;
    cursor: pointer;
    padding: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
    transition: background 0.15s, color 0.15s, transform 0.2s ease;
  }
  .tt-settings-btn svg { display: block; width: 13px; height: 13px; }
  .tt-settings-btn:hover { background: #8a7866; color: #ffffff; }
  .tt-settings-btn.open { transform: rotate(45deg); }

  .tt-settings-panel {
    display: flex;
    flex-direction: column;
    gap: 6px;
    padding: 8px;
    background: rgba(255,255,255,0.55);
    border-radius: 12px;
  }
  .tt-settings-panel.hidden { display: none; }

  .tt-settings-row {
    display: flex;
    align-items: center;
    gap: 6px;
  }

  .tt-settings-color {
    -webkit-appearance: none;
    appearance: none;
    width: 18px; height: 18px;
    border: none;
    border-radius: 50%;
    padding: 0;
    cursor: pointer;
    flex-shrink: 0;
    background: none;
  }
  .tt-settings-color::-webkit-color-swatch-wrapper { padding: 0; }
  .tt-settings-color::-webkit-color-swatch { border: none; border-radius: 50%; }

  .tt-settings-name {
    flex: 1;
    min-width: 0;
    border: 1px solid rgba(0,0,0,0.1);
    background: rgba(255,255,255,0.85);
    border-radius: 100px;
    padding: 4px 10px;
    font-size: 11px;
    outline: none;
  }

  .tt-row-draft {
    border-color: #ffffff;
    transition: box-shadow 0.15s, border-color 0.15s;
  }
  .tt-row-draft.invalid {
    border-color: #c0392b;
    box-shadow: 0 0 0 1.5px #c0392b;
  }

  .tt-draft-cat-wrap {
    position: relative;
    flex-shrink: 0;
    width: 12px;
    height: 12px;
  }

  .tt-draft-cat-dot {
    position: absolute;
    inset: 0;
    border-radius: 50%;
    pointer-events: none;
  }

  .tt-draft-cat-select {
    -webkit-appearance: none;
    appearance: none;
    position: absolute;
    inset: 0;
    width: 100%;
    height: 100%;
    border: none;
    background: transparent;
    opacity: 0;
    cursor: pointer;
  }

  .tt-draft-text {
    flex: 1;
    min-width: 0;
    border: none;
    background: transparent;
    font-size: 12px;
    color: #000000;
    outline: none;
    font-family: -apple-system, "Helvetica Neue", Helvetica, sans-serif;
  }
  .tt-draft-text::placeholder { color: #b0a89c; }

  .tt-draft-time {
    flex-shrink: 0;
    width: 38px;
    border: 1px solid #e8e4df;
    border-radius: 6px;
    padding: 2px 4px;
    font-size: 10px;
    text-align: center;
    outline: none;
    font-family: -apple-system, "Helvetica Neue", Helvetica, sans-serif;
  }
  .tt-draft-time::placeholder { color: #c9c2bb; }

  .tt-draft-sep {
    flex-shrink: 0;
    font-size: 10px;
    color: #8a8278;
  }

  .tt-draft-cancel {
    flex-shrink: 0;
    border: none;
    background: transparent;
    color: #b0a89c;
    cursor: pointer;
    font-size: 14px;
    line-height: 1;
    padding: 0 2px;
  }
  .tt-draft-cancel:hover { color: #8a7866; }
'''

render: () -> """
  <div class="tt-card">
    <div class="tt-header">
      <span class="tt-title">Tasks</span>
      <button class="tt-header-add-btn" id="ttToggleAddBtn" title="Add task">+</button>
      <div class="tt-header-spacer"></div>
      <div class="tt-day-nav">
        <button class="tt-day-arrow" id="ttViewPrevDayBtn" title="Previous day">
          <svg viewBox="0 0 16 16" fill="none">
            <circle cx="8" cy="8" r="7" fill="currentColor"/>
            <path d="M10 5l-4 3 4 3" stroke="#a99584" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
        </button>
        <button class="tt-day-today" id="ttViewTodayBtn" title="Jump to today">Today</button>
        <button class="tt-day-arrow" id="ttViewNextDayBtn" title="Next day">
          <svg viewBox="0 0 16 16" fill="none">
            <circle cx="8" cy="8" r="7" fill="currentColor"/>
            <path d="M6 5l4 3-4 3" stroke="#a99584" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
        </button>
      </div>
    </div>
    <div class="tt-pill-wrap">
      <div class="tt-pill-row" id="ttPillRow">
        <button class="tt-pill pill-all" data-cat="">All</button>
      </div>
    </div>
    <div class="tt-list" id="ttList"></div>
    <div class="tt-bottom-row">
      <button class="tt-clear-btn" id="ttClearBtn" title="Clear completed">Clear</button>
      <button class="tt-settings-btn" id="ttSettingsBtn" title="Settings">
        <svg viewBox="0 0 24 24" fill="currentColor"><path d="m21,10v-1h-1v-2h1v-2h-1v-1h-1v-1h-2v1h-2v-1h-1V1h-4v2h-1v1h-2v-1h-2v1h-1v1h-1v2h1v2h-1v1H1v4h2v1h1v2h-1v2h1v1h1v1h2v-1h2v1h1v2h4v-2h1v-1h2v1h2v-1h1v-1h1v-2h-1v-2h1v-1h2v-4h-2Zm-11,0v-1h4v1h1v4h-1v1h-4v-1h-1v-4h1Z"/></svg>
      </button>
    </div>
    <div class="tt-settings-panel hidden" id="ttSettingsPanel"></div>
  </div>
"""

afterRender: (domEl) ->
  STORAGE_KEY = 'ttTasks'
  CATEGORIES_KEY = 'ttCategories'

  CATEGORY_DEFAULTS = [
    { key: 'personal',  name: 'Personal',  color: '#bea89a' }
    { key: 'career',    name: 'Career',    color: '#9d5727' }
    { key: 'academics', name: 'Academics', color: '#caa05c' }
    { key: 'orgs',      name: 'Orgs',      color: '#8f7155' }
  ]

  defaultTasks = [
    { id: 1, text: 'Task 1', category: 'personal', done: false }
    { id: 2, text: 'Task 1', category: 'personal', done: false }
    { id: 3, text: 'Task 1', category: 'personal', done: false }
    { id: 4, text: 'Task 1', category: 'personal', done: false }
    { id: 5, text: 'Task 1', category: 'personal', done: false }
  ]

  freshDefaultCategories = -> CATEGORY_DEFAULTS.map (c) -> Object.assign({}, c)

  isValidCategory = (c) -> c and c.key and c.name and c.color

  loadCategories = ->
    raw = localStorage.getItem CATEGORIES_KEY
    return freshDefaultCategories() unless raw
    parsed = try
      JSON.parse raw
    catch e
      null
    if Array.isArray(parsed) and parsed.length > 0 and parsed.every(isValidCategory)
      parsed
    else
      freshDefaultCategories()

  saveCategories = (cats) ->
    localStorage.setItem CATEGORIES_KEY, JSON.stringify(cats)

  getCategory = (key) ->
    found = categories.filter((c) -> c.key is key)[0]
    found or { key: key, name: key, color: '#edd7d7' }

  contrastColor = (hex) ->
    hex = hex.replace('#', '')
    r = parseInt(hex.substr(0, 2), 16)
    g = parseInt(hex.substr(2, 2), 16)
    b = parseInt(hex.substr(4, 2), 16)
    luma = (0.299 * r + 0.587 * g + 0.114 * b)
    if luma > 150 then '#000000' else '#ffffff'

  migrateTaskCategory = (rawCat) ->
    return 'personal' unless rawCat
    byKey = CATEGORY_DEFAULTS.filter((c) -> c.key is rawCat)[0]
    return byKey.key if byKey
    byName = CATEGORY_DEFAULTS.filter((c) -> c.name.toLowerCase() is String(rawCat).toLowerCase())[0]
    return byName.key if byName
    'personal'

  loadTasks = ->
    raw = localStorage.getItem STORAGE_KEY
    return defaultTasks unless raw
    parsed = try
      JSON.parse raw
    catch e
      null
    return defaultTasks unless Array.isArray(parsed)
    parsed = parsed.filter (t) -> t
    parsed.forEach (t) -> t.category = migrateTaskCategory(t.category)
    parsed

  saveTasks = (tasks) ->
    localStorage.setItem STORAGE_KEY, JSON.stringify(tasks)

  pad2 = (n) -> if n < 10 then '0' + n else String(n)

  dateToStr = (d) -> d.getFullYear() + '-' + pad2(d.getMonth() + 1) + '-' + pad2(d.getDate())

  todayStr = -> dateToStr(new Date())

  MONTH_NAMES = ['January','February','March','April','May','June','July','August','September','October','November','December']
  MONTH_SHORT = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']

  formatDisplayDate = (str) ->
    [y, m, d] = str.split('-').map (n) -> parseInt(n, 10)
    MONTH_NAMES[m - 1] + ' ' + d + ', ' + y

  formatShortDate = (str) ->
    [y, m, d] = str.split('-').map (n) -> parseInt(n, 10)
    MONTH_SHORT[m - 1] + ' ' + d

  addDayToStr = (str) ->
    [y, m, d] = str.split('-').map (n) -> parseInt(n, 10)
    date = new Date(y, m - 1, d)
    date.setDate(date.getDate() + 1)
    dateToStr(date)

  subDayFromStr = (str) ->
    [y, m, d] = str.split('-').map (n) -> parseInt(n, 10)
    date = new Date(y, m - 1, d)
    date.setDate(date.getDate() - 1)
    dateToStr(date)

  categories = loadCategories()
  tasks = loadTasks()
  activeCategory = localStorage.getItem('ttActiveCategory') or ''
  viewDate = localStorage.getItem('ttViewDate') or todayStr()
  draftTask = null

  q = (id) -> domEl.querySelector('#' + id)

  formatTime = (val) ->
    return '' unless val
    [h, m] = val.split(':').map (n) -> parseInt(n, 10)
    period = if h >= 12 then 'pm' else 'am'
    h12 = h % 12
    h12 = 12 if h12 is 0
    h12 + ':' + (if m < 10 then '0' + m else m) + period

  formatTimeRange = (start, end) ->
    if start and end
      formatTime(start) + '–' + formatTime(end)
    else
      formatTime(start) + formatTime(end)

  parseTimeInput = (raw) ->
    str = (raw or '').trim().toLowerCase()
    return '' unless str
    m = str.match /^(\d{1,2})(?::?(\d{2}))?\s*(am|pm)?$/
    return '' unless m
    hour = parseInt(m[1], 10)
    minute = if m[2] then parseInt(m[2], 10) else 0
    period = m[3]
    return '' if hour > 23 or minute > 59
    if period
      hour = hour % 12
      hour += 12 if period is 'pm'
    else if hour >= 13 or hour is 0
      # already an explicit 24h hour (or midnight) — leave as-is
    else
      # no am/pm given: assume pm
      hour = if hour is 12 then 12 else hour + 12
    pad2(hour) + ':' + pad2(minute)

  isOverdue = (t) ->
    return false if t.done or not t.end
    [y, m, d] = (t.date or todayStr()).split('-').map (n) -> parseInt(n, 10)
    [h, mi] = t.end.split(':').map (n) -> parseInt(n, 10)
    new Date(y, m - 1, d, h, mi) < new Date()

  renderDayLabel = ->
    btn = q('ttViewTodayBtn')
    isToday = viewDate is todayStr()
    btn.textContent = if isToday then 'Today' else formatShortDate(viewDate)
    btn.title = formatDisplayDate(viewDate)

  startEdit = (t, txt) ->
    input = document.createElement 'input'
    input.type = 'text'
    input.className = 'tt-edit-input'
    input.value = t.text
    input.maxLength = 60
    txt.replaceWith input
    input.focus()
    input.select()

    commit = ->
      newText = input.value.trim()
      t.text = newText if newText
      saveTasks tasks
      renderList()

    input.addEventListener 'blur', commit
    input.addEventListener 'keydown', (e) ->
      if e.key is 'Enter'
        input.blur()
      else if e.key is 'Escape'
        input.removeEventListener 'blur', commit
        renderList()

  buildDraftRow = ->
    row = document.createElement 'div'
    row.className = 'tt-row tt-row-draft'
    row.onclick = (e) -> e.stopPropagation()

    catWrap = document.createElement 'span'
    catWrap.className = 'tt-draft-cat-wrap'

    catDot = document.createElement 'span'
    catDot.className = 'tt-draft-cat-dot'

    catSel = document.createElement 'select'
    catSel.className = 'tt-draft-cat-select'
    categories.forEach (c) ->
      opt = document.createElement 'option'
      opt.value = c.key
      opt.textContent = c.name
      opt.selected = c.key is draftTask.category
      catSel.appendChild opt
    updateCatDot = ->
      info = getCategory(catSel.value)
      catDot.style.background = info.color
      catWrap.title = info.name
    catSel.onchange = ->
      draftTask.category = catSel.value
      updateCatDot()
    updateCatDot()

    catWrap.appendChild catDot
    catWrap.appendChild catSel
    row.appendChild catWrap

    textInput = document.createElement 'input'
    textInput.type = 'text'
    textInput.className = 'tt-draft-text'
    textInput.placeholder = 'Task name'
    textInput.maxLength = 60
    textInput.value = draftTask.text
    textInput.oninput = ->
      draftTask.text = textInput.value
      row.classList.remove 'invalid'
    textInput.addEventListener 'keydown', (e) ->
      attemptSaveDraft() if e.key is 'Enter'
    row.appendChild textInput

    startInput = document.createElement 'input'
    startInput.type = 'text'
    startInput.className = 'tt-draft-time'
    startInput.placeholder = 'Start'
    startInput.value = draftTask.start
    startInput.oninput = ->
      draftTask.start = startInput.value
      row.classList.remove 'invalid'
    startInput.addEventListener 'keydown', (e) ->
      attemptSaveDraft() if e.key is 'Enter'
    row.appendChild startInput

    sep = document.createElement 'span'
    sep.className = 'tt-draft-sep'
    sep.textContent = '–'
    row.appendChild sep

    endInput = document.createElement 'input'
    endInput.type = 'text'
    endInput.className = 'tt-draft-time'
    endInput.placeholder = 'End'
    endInput.value = draftTask.end
    endInput.oninput = ->
      draftTask.end = endInput.value
      row.classList.remove 'invalid'
    endInput.addEventListener 'keydown', (e) ->
      attemptSaveDraft() if e.key is 'Enter'
    row.appendChild endInput

    cancelBtn = document.createElement 'button'
    cancelBtn.className = 'tt-draft-cancel'
    cancelBtn.textContent = '✕'
    cancelBtn.title = 'Discard'
    cancelBtn.onclick = (e) ->
      e.stopPropagation()
      cancelDraft()
    row.appendChild cancelBtn

    row

  attemptSaveDraft = ->
    return unless draftTask
    text = draftTask.text.trim()
    start = parseTimeInput(draftTask.start)
    end = parseTimeInput(draftTask.end)
    if text and start and end
      tasks.push { id: Date.now(), text: text, category: draftTask.category, done: false, start: start, end: end, date: viewDate }
      saveTasks tasks
      draftTask = null
      renderList()
    else
      row = domEl.querySelector('.tt-row-draft')
      row?.classList.add 'invalid'

  cancelDraft = ->
    draftTask = null
    renderList()

  renderList = ->
    list = q('ttList')
    list.innerHTML = ''
    if draftTask
      list.appendChild buildDraftRow()
    visible = tasks.filter (t) ->
      (not activeCategory or t.category is activeCategory) and
        (t.date or todayStr()) is viewDate
    visible.sort (a, b) -> (a.start or '99:99').localeCompare(b.start or '99:99')
    visible.forEach (t) ->
      row = document.createElement 'div'
      row.className = 'tt-row'

      cb = document.createElement 'button'
      cb.className = 'tt-checkbox' + (if t.done then ' done' else '')
      cb.title = 'Toggle done'
      cb.onclick = ->
        t.done = not t.done
        saveTasks tasks
        renderList()
      row.appendChild cb

      catInfo = getCategory(t.category)
      cat = document.createElement 'span'
      cat.className = 'tt-category'
      cat.style.background = catInfo.color
      cat.style.color = contrastColor(catInfo.color)
      catLabel = document.createElement 'span'
      catLabel.className = 'tt-category-label'
      catLabel.textContent = catInfo.name
      cat.appendChild catLabel
      cat.onmouseenter = ->
        cat.classList.add 'expanded'
        cat.style.width = (catLabel.scrollWidth + 16) + 'px'
      cat.onmouseleave = ->
        cat.classList.remove 'expanded'
        cat.style.width = '12px'
      row.appendChild cat

      txt = document.createElement 'span'
      txt.className = 'tt-text' + (if t.done then ' done' else '') + (if isOverdue(t) then ' overdue' else '')
      txt.textContent = t.text
      txt.title = 'Click to edit'
      txt.onclick = (e) ->
        e.stopPropagation()
        startEdit(t, txt)
      row.appendChild txt

      if t.start or t.end
        timeLabel = document.createElement 'span'
        timeLabel.className = 'tt-time-label'
        timeLabel.textContent = formatTimeRange(t.start, t.end)
        row.appendChild timeLabel

      actions = document.createElement 'div'
      actions.className = 'tt-row-actions'

      nextDay = document.createElement 'button'
      nextDay.className = 'tt-next-day'
      nextDay.title = 'Move to next day'
      nextDay.innerHTML = '<svg viewBox="0 0 16 16" fill="none"><path d="M3 8h10M9 4l4 4-4 4" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg>'
      nextDay.onclick = (e) ->
        e.stopPropagation()
        t.date = addDayToStr(t.date or todayStr())
        saveTasks tasks
        renderList()
      actions.appendChild nextDay

      del = document.createElement 'button'
      del.className = 'tt-remove'
      del.textContent = '✕'
      del.title = 'Remove task'
      del.onclick = (e) ->
        e.stopPropagation()
        tasks = tasks.filter (x) -> x.id isnt t.id
        saveTasks tasks
        renderList()
      actions.appendChild del

      row.appendChild actions

      list.appendChild row

  $(domEl).find('#ttToggleAddBtn').on 'click', (e) ->
    e.stopPropagation()
    return if draftTask
    draftTask = { category: categories[0].key, text: '', start: '', end: '' }
    renderList()
    setTimeout (-> domEl.querySelector('.tt-draft-text')?.focus()), 0

  $(domEl).on 'mousedown', (e) ->
    return unless draftTask
    row = domEl.querySelector('.tt-row-draft')
    return unless row
    unless row.contains(e.target) or e.target.id is 'ttToggleAddBtn'
      attemptSaveDraft()

  $(domEl).find('#ttViewNextDayBtn').on 'click', ->
    viewDate = addDayToStr(viewDate)
    localStorage.setItem 'ttViewDate', viewDate
    renderDayLabel()
    renderList()

  $(domEl).find('#ttViewPrevDayBtn').on 'click', ->
    viewDate = subDayFromStr(viewDate)
    localStorage.setItem 'ttViewDate', viewDate
    renderDayLabel()
    renderList()

  $(domEl).find('#ttViewTodayBtn').on 'click', ->
    viewDate = todayStr()
    localStorage.setItem 'ttViewDate', viewDate
    renderDayLabel()
    renderList()

  $(domEl).find('#ttClearBtn').on 'click', ->
    tasks = tasks.filter (t) -> not t.done
    saveTasks tasks
    renderList()

  selectCategory = (key) ->
    activeCategory = key
    localStorage.setItem 'ttActiveCategory', activeCategory
    renderPills()
    renderList()

  renderPills = ->
    row = q('ttPillRow')
    row.innerHTML = ''

    allBtn = document.createElement 'button'
    allBtn.className = 'tt-pill pill-all' + (if activeCategory is '' then ' active' else '')
    allBtn.textContent = 'All'
    allBtn.onclick = -> selectCategory('')
    row.appendChild allBtn

    categories.forEach (c) ->
      btn = document.createElement 'button'
      btn.className = 'tt-pill' + (if activeCategory is c.key then ' active' else '')
      btn.style.background = c.color
      btn.style.color = contrastColor(c.color)
      btn.textContent = c.name
      btn.onclick = -> selectCategory(c.key)
      row.appendChild btn

  renderSettingsPanel = ->
    panel = q('ttSettingsPanel')
    panel.innerHTML = ''
    categories.forEach (c) ->
      row = document.createElement 'div'
      row.className = 'tt-settings-row'

      colorInput = document.createElement 'input'
      colorInput.type = 'color'
      colorInput.className = 'tt-settings-color'
      colorInput.value = c.color
      colorInput.oninput = ->
        c.color = colorInput.value
        saveCategories(categories)
        renderPills()
        renderList()
      row.appendChild colorInput

      nameInput = document.createElement 'input'
      nameInput.type = 'text'
      nameInput.className = 'tt-settings-name'
      nameInput.value = c.name
      nameInput.maxLength = 20
      nameInput.onblur = ->
        c.name = nameInput.value.trim() or c.name
        nameInput.value = c.name
        saveCategories(categories)
        renderPills()
        renderList()
      nameInput.addEventListener 'keydown', (e) ->
        nameInput.blur() if e.key is 'Enter'
      row.appendChild nameInput

      panel.appendChild row

  $(domEl).find('#ttSettingsBtn').on 'click', ->
    panel = q('ttSettingsPanel')
    isHidden = panel.classList.contains 'hidden'
    panel.classList.toggle 'hidden'
    q('ttSettingsBtn').classList.toggle 'open', isHidden

  renderPills()
  renderSettingsPanel()
  renderDayLabel()
  renderList()
