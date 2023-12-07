<?php 
function showAccordion(){
echo"<div class='accordion accordion-flush' id='accordionFlushNavBar'>
<div class='accordion-item'>
      <h2 class='accordion-header' id='flush-heading-OS'>
            <button class='accordion-button collapsed' type='button'
                  data-bs-toggle='collapse' data-bs-target='#flush-collapse-OS'
                  aria-expanded='false' aria-controls='flush-collapse-OS'>
                  OS
            </button>
      </h2>
      <div id='flush-collapse-OS' class='accordion-collapse collapse'
            aria-labelledby='flush-heading-OS'
            data-bs-parent='#accordionFlushNavBar'>
            <div class='accordion-body'>
                  <ul>
                        <li><a href=''>Linux</a></li>
                        <li><a href=''>Windows</a></li>
                  </ul>
            </div>
      </div>
</div>
<div class='accordion-item'>
      <h2 class='accordion-header' id='flush-heading-Software'>
            <button class='accordion-button collapsed' type='button'
                  data-bs-toggle='collapse'
                  data-bs-target='#flush-collapse-Software' aria-expanded='false'
                  aria-controls='flush-collapse-Software'>
                  Software
            </button>
      </h2>
      <div id='flush-collapse-Software' class='accordion-collapse collapse'
            aria-labelledby='flush-heading-Software'
            data-bs-parent='#accordionFlushNavBar'>
            <div class='accordion-body'>
                  <ul>
                        <li><a href=''>Git</a></li>
                        <li><a href=''>VsCode</a></li>
                        <li><a href=''>Figma</a></li>
                  </ul>
            </div>
      </div>
</div>
<div class='accordion-item'>
      <h2 class='accordion-header' id='flush-heading-Useful-Site'>
            <button class='accordion-button collapsed' type='button'
                  data-bs-toggle='collapse'
                  data-bs-target='#flush-collapse-Useful-Site' aria-expanded='false'
                  aria-controls='flush-collapse-Useful-Site'>
                  Useful Site
            </button>
      </h2>
      <div id='flush-collapse-Useful-Site' class='accordion-collapse collapse'
            aria-labelledby='flush-heading-Useful-Site'
            data-bs-parent='#accordionFlushNavBar'>
            <div class='accordion-body'>
                  <ul>
                        <li><a href=''>1</a></li>
                        <li><a href=''>2</a></li>
                        <li><a href=''>3</a></li>
                  </ul>
            </div>
      </div>
</div>
<div class='accordion-item'>
      <h2 class='accordion-header' id='flush-heading-Courses'>
            <button class='accordion-button collapsed' type='button'
                  data-bs-toggle='collapse' data-bs-target='#flush-collapse-Courses'
                  aria-expanded='false' aria-controls='flush-collapse-Courses'>
                  Courses
            </button>
      </h2>
      <div id='flush-collapse-Courses' class='accordion-collapse collapse'
            aria-labelledby='flush-heading-Courses'
            data-bs-parent='#accordionFlushNavBar'>
            <div class='accordion-body'>
                  <div class='accordion-item'>
                        <h3 class='accordion-header' id='flush-heading-HTML-CSS'>
                              <button class='accordion-button collapsed'
                                    type='button' data-bs-toggle='collapse'
                                    data-bs-target='#flush-collapse-HTML-CSS'
                                    aria-expanded='false'
                                    aria-controls='flush-collapse-HTML-CSS'>
                                    HTML/CSS
                              </button>
                        </h3>
                        <div id='flush-collapse-HTML-CSS'
                              class='accordion-collapse collapse'
                              aria-labelledby='flush-heading-HTML-CSS'
                              data-bs-parent='#flush-heading-Courses'>
                              <div class='accordion-body'>
                                    <ul>
                                          <li><a href=''>1</a></li>
                                          <li><a href=''>2</a></li>
                                          <li><a href=''>3</a></li>
                                    </ul>
                              </div>
                        </div>
                  </div>
                  <div class='accordion-item'>
                        <h3 class='accordion-header' id='flush-heading-JavaScript'>
                              <button class='accordion-button collapsed'
                                    type='button' data-bs-toggle='collapse'
                                    data-bs-target='#flush-collapse-JavaScript'
                                    aria-expanded='false'
                                    aria-controls='flush-collapse-JavaScript'>
                                    JavaScript
                              </button>
                        </h3>
                        <div id='flush-collapse-JavaScript'
                              class='accordion-collapse collapse'
                              aria-labelledby='flush-heading-JavaScript'
                              data-bs-parent='#flush-heading-Courses'>
                              <div class='accordion-body'>
                                    <ul>
                                          <li><a href=''>TP</a></li>
                                          <li><a href=''>2</a></li>
                                          <li><a href=''>3</a></li>
                                    </ul>
                              </div>
                        </div>
                  </div>
                  <div class='accordion-item'>
                  <h3 class='accordion-header' id='flush-heading-AJAX'>
                        <button class='accordion-button collapsed'
                              type='button' data-bs-toggle='collapse'
                              data-bs-target='#flush-collapse-AJAX'
                              aria-expanded='false'
                              aria-controls='flush-collapse-AJAX'>
                              AJAX
                        </button>
                  </h3>
                  <div id='flush-collapse-AJAX'
                        class='accordion-collapse collapse'
                        aria-labelledby='flush-heading-AJAX'
                        data-bs-parent='#flush-heading-Courses'>
                        <div class='accordion-body'>
                              <ul>
                                    <li><a href=''>TP</a></li>
                                    <li><a href=''>2</a></li>
                                    <li><a href=''>3</a></li>
                              </ul>
                        </div>
                  </div>
                  <div class='accordion-item'>
                        <h3 class='accordion-header' id='flush-heading-PHP'>
                              <button class='accordion-button collapsed'
                                    type='button' data-bs-toggle='collapse'
                                    data-bs-target='#flush-collapse-PHP'
                                    aria-expanded='false'
                                    aria-controls='flush-collapse-PHP'>
                                    PHP
                              </button>
                        </h3>
                        <div id='flush-collapse-PHP'
                              class='accordion-collapse collapse'
                              aria-labelledby='flush-heading-PHP'
                              data-bs-parent='#flush-heading-Courses'>
                              <div class='accordion-body'>
                                    <ul>
                                          <li><a href='./page/PHP/demo-php-1.php'>TP-1</a></li>
                                          <li><a href='./page/PHP/demo-php-2.php'>TP-2</a></li>
                                          <li><a href=''>TP-3</a></li>
                                    </ul>
                              </div>
                        </div>
            </div>
            </div>
      </div>
</div>
<div class='accordion-item'>
      <h2 class='accordion-header' id='flush-heading-MySites'>
            <button class='accordion-button collapsed' type='button'
                  data-bs-toggle='collapse' data-bs-target='#flush-collapse-MySites'
                  aria-expanded='false' aria-controls='flush-collapse-MySites'>
                  My Websites
            </button>
      </h2>
      <div id='flush-collapse-MySites' class='accordion-collapse collapse'
            aria-labelledby='flush-heading-MySites'
            data-bs-parent='#accordionFlushNavBar'>
            <div class='accordion-body'>
                  <ul>
                        <li><a href=''>My portfolio</a></li>
                        <li><a href=''>Miels Gobert</a></li>
                        <li><a href=''>Eval livres</a></li>
                  </ul>
            </div>
      </div>
</div>
<div class='accordion-item'>
      <h2 class='accordion-header' id='flush-heading-Sandbox'>
            <button class='accordion-button collapsed' type='button'
                  data-bs-toggle='collapse' data-bs-target='#flush-collapse-Sandbox'
                  aria-expanded='false' aria-controls='flush-collapse-Sandbox'>
                  Sandbox
            </button>
      </h2>
      <div id='flush-collapse-Sandbox' class='accordion-collapse collapse'
            aria-labelledby='flush-heading-Sandbox'
            data-bs-parent='#accordionFlushNavBar'>
            <div class='accordion-body'>
                  <ul>
                        <li><a href=''>1</a></li>
                        <li><a href=''>2</a></li>
                        <li><a href=''>3</a></li>
                  </ul>
            </div>
      </div>
</div></div></div>
";
}
?>