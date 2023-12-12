<!DOCTYPE html>
<html lang="en">

<head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="/bootstrap-5.3.2/css/bootstrap.css">
      <link rel="stylesheet" href="/fontawesome-free-6.5.0/css/all.css">
      <script src="/bootstrap-5.3.2/js/bootstrap.bundle.js" defer></script>
      <?php
            require_once("Accordion.html.php");
      ?>
      <link rel="stylesheet" href="./css/style.css">

      <title>Document</title>

      <style>
      #aside-left,
      #section-bs {
            min-height: 70vh;
            margin-top: 10vh;
      }

      #section-bs {
            overflow: auto;
            position: relative !important;
      }

      @media screen and (max-widht:750px) {
            #aside-left {
                  width: 100%;
            }
      }
      </style>
</head>

<body>
      <!-- header -->
      <div class="">
            <nav class="navbar navbar-expand-md bg-dark text-light fixed-top rounded-bottom">
                  <a href="" class="btn"><i class="fa fa-laptop fa-2x text-light"></i></a>
                  <a href="#nav" class="btn bg-light navbar-toggler mx-2" data-bs-toggle='collapse'><i
                              class="fa fa-bars"></i></a>
                  <div id="nav" class="collapse navbar-collapse justify-content-between">
                        <ul class="navbar-nav px-2">
                              <li class="nav-item"><a href="index.php" class="nav-link text-light fw-bold">Acceuil</a>
                              </li>
                              <li class="nav-item"><a href="article.php" class="nav-link text-light fw-bold">Article</a>
                              </li>
                              <li class="nav-item"><a href="article-AJAX.php"
                                          class="nav-link text-light fw-bold">Article AJAX</a>
                              </li>
                              <li class="nav-item"><a href="client.php" class="nav-link text-light fw-bold">Client</a>
                              </li>
                              <li class="nav-item dropdown"><a href=""
                                          class="nav-link text-light fw-bold dropdown-toggle" data-bs-toggle="dropdown"
                                          data-bs-auto-close="outside">Commande</a>
                                    <ul class="dropdown-menu">
                                          <li class="nav-item dropdown-item"><a href="" class="nav-link">Devis</a></li>
                                          <li class="nav-item dropdown-item"><a href="" class="nav-link">Facture</a>
                                          </li>
                                          <li class="nav-item dropend dropdown-item">
                                                <a href="" class="nav-link text-primary dropdown-toggle"
                                                      data-bs-toggle="dropdown">Livraison</a>
                                                <ul class="dropdown-menu">
                                                      <li class="nav-item dropdown-item"><a href=""
                                                                  class="nav-link">Domicile</a></li>
                                                      <li class="nav-item dropdown-item"><a href=""
                                                                  class="nav-link">Magasin</a></li>
                                                </ul>
                                          </li>
                                    </ul>
                              </li>
                              <li class="nav-item"><a href="" class="nav-link text-light fw-bold">Parametre</a></li>
                        </ul>
                        <form action="">
                              <div class="input-group">
                                    <input onKeyDown="touche(event)" id="mot" name="mot" type="text" class="form-control mx-2" placeholder="Mot à chercher">
                                    <a href="javascript:rechercher()" class="btn bg-light rounded-end"><i class="fa fa-search"></i></a>
                                    <a href="" class="btn mx-2 dropdown-toggle text-light" data-bs-toggle="dropdown">
                                          <i class="fa fa-bell text-light fa-2x"></i>
                                          <span
                                                class="position-absolute top-10 start-70 translate-middle badge rounded-pill bg-danger">5</span></a>
                                    <ul class="dropdown-menu">
                                          <li class="nav-item">message - 01</li>
                                          <li class="nav-item">message - 02</li>
                                          <li class="nav-item">message - 03</li>
                                          <li class="nav-item">message - 04</li>
                                          <li class="nav-item">message - 05</li>
                                          <li class="nav-item">message - 06</li>
                                    </ul>
                                    <a href="" class="btn dropdown-toggle text-light" data-bs-toggle="dropdown"><i
                                                class="fa fa-user"></i>GoT</a>
                                    <ul class="dropdown-menu">
                                          <li class="nav-item"><a href="" class="nav-link"></a>Compte</li>
                                          <li class="nav-item"><a href="" class="nav-link"></a>Changement mot de passe
                                          </li>
                                          <li class="nav-item"><a href="" class="nav-link"></a>Deconnexion</li>
                                    </ul>
                              </div>
                        </form>
                  </div>
            </nav>


            <div class="row">
                  <div class="col-2">
                        <?=showAccordion()?>
                  </div>
                  <div id="section-bs" class="col-8">
                        <?=$content?>
                  </div>
                  <div class="col-2">
                        
                  </div>
            </div>

      <footer class="my-4">
            <div class="row bg-dark justify-content-center">
                  <div class="col-sm-3 col-md-3 col-lg-3 text-light">
                        <h5 class="text-warning text-uppercase">Nos Produits</h5>
                        <p>Bière</p>
                        <p>Vin</p>
                        <p>Jus</p>
                  </div>
                  <div class="col-sm-3 col-md-3 col-lg-3 text-light">
                        <h5 class="text-warning text-uppercase">Qui sommes nous</h5>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi officiis quisquam
                              voluptatem
                              tempore consectetur vel eos aut ipsam amet dolore fugit iusto tenetur, quo rem
                              dignissimos
                              doloribus eveniet numquam aspernatur.</p>
                  </div>

                  <div class="col-sm-3 col-md-3 col-lg-3 text-light">
                        <h5 class="text-warning text-uppercase">Contacts</h5>
                        <ul>
                              <li><i class="fa fa-home"></i>DWWM</li>
                              <li><i class="fa fa-envelope"></i>dwwm@stage.fr</li>
                              <li><i class="fa fa-phone">8 52 22</i></li>
                              <li><i class="fa fa-print"></i></li>
                              <li><i class="fa fa-car"></i></li>
                              <li><i class="fa fa-code"></i></li>
                              <li><i class="fa fa-cat"></i></li>
                              <li><i class="fa fa-dog"></i></li>
                              <li><i class="fa fa-unity fa-5x"></i></li>
                        </ul>
                  </div>
            </div>
            <div class="row bg-dark justify-content-center align-items-center">
                  <div class="col-md-4">
                        <a href="" class="btn"><i class="fab fa-facebook text-light fa-2x"></i></a>
                        <a href="" class="btn"><i class="fab fa-twitter text-light fa-2x"></i></a>
                        <a href="" class="btn"><i class="fab fa-linkedin text-light fa-2x"></i></a>
                  </div>
            </div>
      </footer>
</div>
</body>

</html>