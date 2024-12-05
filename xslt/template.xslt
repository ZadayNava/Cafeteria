﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes"/>

	<!--Creamos una variable que reciba un parametro desde el procesador
	la propiedad "name" establece el nombre de la variable
	la propiedad select establece el origen del dato de la variable-->
	<xsl:param name="TipoMenu" select="TipoMenu"></xsl:param>
	<xsl:param name="TipoBebidas" select="TipoBebidas"></xsl:param>

	<!--Mi template Principal
	La idea es recrear el comportamiento de una "pagina maestra" donde la pagina principal carga los elementos
	que son "constantes" en el resto del sitio-->

	<xsl:template match="Menu">

		<html lang="en">

			<head>
				<meta charset="utf-8"></meta>
				<meta content="width=device-width, initial-scale=1.0" name="viewport"></meta>

				<title>Restaurantly Bootstrap Template - Index</title>
				<meta content="" name="description"></meta>
				<meta content="" name="keywords"></meta>

				<!-- Favicons -->
				<link href="assets/img/favicon.png" rel="icon"></link>
				<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon"></link>

				<!-- Google Fonts -->
				<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet"></link>

				<!-- Vendor CSS Files -->
				<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet"></link>
				<link href="assets/vendor/aos/aos.css" rel="stylesheet"></link>
				<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"></link>
				<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"></link>
				<link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet"></link>
				<link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet"></link>
				<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet"></link>

				<!-- Template Main CSS File -->
				<link href="assets/css/style.css" rel="stylesheet"></link>

			</head>

			<body>

				<!-- ======= Top Bar ======= -->
				<div id="topbar" class="d-flex align-items-center fixed-top">
					<div class="container d-flex justify-content-center justify-content-md-between">

						<div class="contact-info d-flex align-items-center">
							<i class="bi bi-phone d-flex align-items-center">
								<span>+1 5589 55488 55</span>
							</i>
							<i class="bi bi-clock d-flex align-items-center ms-4">
								<span> Mon-Sat: 11AM - 23PM</span>
							</i>
						</div>

						<div class="languages d-none d-md-flex align-items-center">
							<ul>
								<li>En</li>
								<li>
									<a href="#">De</a>
								</li>
							</ul>
						</div>
					</div>
				</div>

				<!-- ======= Header ======= -->
				<header id="header" class="fixed-top d-flex align-items-cente">
					<div class="container-fluid container-xl d-flex align-items-center justify-content-lg-between">

						<h1 class="logo me-auto me-lg-0">
							<a href="index.html">Restaurantly</a>
						</h1>
						<!-- Uncomment below if you prefer to use an image logo -->
						<!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

						<nav id="navbar" class="navbar order-last order-lg-0">
							<ul>
								<!--Creo una lista dinamica a partir de las opciones del xml-->
								<xsl:for-each select="Opciones/Opcion">
									<!--xsl:choose funcina como un Switch, permitiendome crear casos que empaten en funcion de una condicion y declarar una condicion default-->
									<li>
										<xsl:choose>
											<xsl:when test="$TipoMenu = @Id">
												<a class="nav-link scrollto active" href="{@Url}">
													<xsl:value-of select="@Texto"/>
												</a>
											</xsl:when>
											<xsl:otherwise>
												<a class="nav-link scrollto" href="{@Url}">
													<xsl:value-of select="@Texto"/>
												</a>
											</xsl:otherwise>
										</xsl:choose>

									</li>
								</xsl:for-each>
							</ul>
							<i class="bi bi-list mobile-nav-toggle"></i>
						</nav>
						<!-- .navbar -->
						<a href="#book-a-table" class="book-a-table-btn scrollto d-none d-lg-flex">Book a table</a>

					</div>
				</header>
				<!-- End Header -->

				<!-- ======= Hero Section ======= -->
				<section id="hero" class="d-flex align-items-center">
					<div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100">
						<div class="row">
							<div class="col-lg-8">
								<h1>
									Bienvenido a <span>
										<xsl:value-of select="DAtos/NombreRestaurante"/>
									</span>
								</h1>
								<h2>
									<xsl:value-of select="Datos/Descripcion"/>
								</h2>

								<div class="btns">
									<a href="#menu" class="btn-menu animated fadeInUp scrollto">Nuestro Menú</a>
								</div>
							</div>
							<div class="col-lg-4 d-flex align-items-center justify-content-center position-relative" data-aos="zoom-in" data-aos-delay="200">
								<a href="https://www.youtube.com/watch?v=GlrxcuEDyF8" class="glightbox play-btn"></a>
							</div>

						</div>
					</div>
				</section>
				<!-- End Hero -->

				<!-- ======= Choose Section ======= -->
				<xsl:choose>
					<xsl:when test="$TipoMenu = 0">
						<xsl:call-template name="Home"></xsl:call-template>
					</xsl:when>
					<xsl:when test="$TipoMenu = 1">
						<xsl:call-template name="Carta"></xsl:call-template>
					</xsl:when>
					<xsl:when test="$TipoMenu = 2">
						<xsl:call-template name="Contacto"></xsl:call-template>
					</xsl:when>
					<xsl:when test="$TipoMenu = 3">
						<xsl:call-template name="PlayRomm"></xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="Home"></xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
				<!-- End Choose -->

				<!-- ======= Footer ======= -->
				<footer id="footer">
					<div class="footer-top">
						<div class="container">
							<div class="row">

								<div class="col-lg-3 col-md-6">
									<div class="footer-info">
										<h3>Restaurantly</h3>
										<p>
											A108 Adam Street <br></br>
											NY 535022, USA<br></br>
											<br></br>
											<strong>Phone:</strong> +1 5589 55488 55<br></br>
											<strong>Email:</strong> info@example.com<br></br>
										</p>
										<div class="social-links mt-3">
											<a href="#" class="twitter">
												<i class="bx bxl-twitter"></i>
											</a>
											<a href="#" class="facebook">
												<i class="bx bxl-facebook"></i>
											</a>
											<a href="#" class="instagram">
												<i class="bx bxl-instagram"></i>
											</a>
											<a href="#" class="google-plus">
												<i class="bx bxl-skype"></i>
											</a>
											<a href="#" class="linkedin">
												<i class="bx bxl-linkedin"></i>
											</a>
										</div>
									</div>
								</div>

								<div class="col-lg-2 col-md-6 footer-links">
									<h4>Useful Links</h4>
									<ul>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Home</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">About us</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Services</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Terms of service</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Privacy policy</a>
										</li>
									</ul>
								</div>

								<div class="col-lg-3 col-md-6 footer-links">
									<h4>Our Services</h4>
									<ul>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Web Design</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Web Development</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Product Management</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Marketing</a>
										</li>
										<li>
											<i class="bx bx-chevron-right"></i>
											<a href="#">Graphic Design</a>
										</li>
									</ul>
								</div>

								<div class="col-lg-4 col-md-6 footer-newsletter">
									<h4>Our Newsletter</h4>
									<p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
									<form action="" method="post">
										<input type="email" name="email"></input>
										<input type="submit" value="Subscribe"></input>

									</form>

								</div>

							</div>
						</div>
					</div>

					<div class="container">

						<div class="credits">
							<!-- All the links in the footer should remain intact. -->
							<!-- You can delete the links only if you purchased the pro version. -->
							<!-- Licensing information: https://bootstrapmade.com/license/ -->
							<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/restaurantly-restaurant-template/ -->
							Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
						</div>
					</div>
				</footer>
				<!-- End Footer -->

				<div id="preloader"></div>
				<a href="#" class="back-to-top d-flex align-items-center justify-content-center">
					<i class="bi bi-arrow-up-short"></i>
				</a>

				<!-- Vendor JS Files -->
				<script src="assets/vendor/aos/aos.js"></script>
				<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
				<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
				<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
				<script src="assets/vendor/php-email-form/validate.js"></script>
				<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

				<!-- Template Main JS File -->
				<script src="assets/js/main.js"></script>

			</body>

		</html>

		<!--	<xsl:value-of select="Opciones/Opcion/@Texto"/>
		<xsl:for-each select="Opciones/Opcion">
			<br></br>
			<xsl:value-of select="@Texto"/>
			<br></br>
		</xsl:for-each>
		<xsl:for-each select="Platillos/Tipo">
			<xsl:choose>
				<xsl:when test="@Nombre = 'Desayunos'">
					<h1 style="color:red;">
						<xsl:value-of select="@Nombre"/>
					</h1>
						<xsl:for-each select="Platillo">
							<ul>
								<li>
									<xsl:value-of select="@Nombre"/>
								</li>
								<li>
									<xsl:value-of select="Descripcion"/>
								</li>
								<li>
									<xsl:value-of select="Precio"/>
								</li>
							</ul>
						</xsl:for-each>
				</xsl:when>
				<xsl:when test="@Nombre = 'Comidas'">
					<h1 style="color:yellow;">
						<xsl:value-of select="@Nombre"/>
					</h1>
				</xsl:when>
				<xsl:otherwise>
					<h2 style="color:green;">
						<xsl:value-of select="@Nombre"/>
					</h2>					
				</xsl:otherwise>
			</xsl:choose>			
		</xsl:for-each>-->
	</xsl:template>

	<!--Templeate adicionales-->
	<!--Son "microtempleates que contienen estructura y contenido en funcion de la pagina/segmento que se desea mostrar-->
	<xsl:template name="Home">

		<!-- ======= Why Us Section ======= -->
		<section id="why-us" class="why-us">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Platillos</h2>
					<p>Nuestros Platillos Favoritos</p>
				</div>

				<div class="row">
					<!--PRODUCTOS POPULARES DESDE EL ML-->
					<!--Creo una recorrido para seleccinar el primero platillo de cada tipo de platillo excepto de bebidas-->
					<xsl:for-each select="Platillos/Tipo[@Nombre != 'Bebidas']/Platillo[@Orden = 1]">
						<div class="col-lg-4">
							<div class="box" data-aos="zoom-in" data-aos-delay="100">
								<div class="section-title">
									<h2>
										<!--El nombre del tipo de platillo-->
										<xsl:value-of select="../@Nombre"/>
									</h2>
								</div>
								<br></br>
								<!--Inferimos el dato proveniente del nodo en la propiedad de la etiqueta (imagen)-->
								<img src="{Imagen}" alt="{Imagen}" style="width:100%; height:auto;"></img>
								<br></br>
								<h4>
									<!--Aqui muestro el nombre del platillo-->
									<!--aqui toma la primera letra en h4 y del resto lo hace en h5-->
									<span style="display:contents;">
										<!--substring(cadena, lugar inicial, numero de la cadena-->
										<xsl:value-of select="substring(@Nombre, 1, 1)"/>
									</span>
									<!--string-length(cadena) => el total de datos de la cadena-->
									<xsl:value-of select="substring(@Nombre,2, string-length(@Nombre))"/>
								</h4>
								<h5>
									<xsl:value-of select="Precio"/>
								</h5>
								<p>
									<xsl:value-of select="Descripcion"/>
								</p>
							</div>
						</div>
					</xsl:for-each>
				</div>
			</div>
		</section>
		<!-- End Why Us Section -->

		<!-- ======= Events Section ======= -->
		<section id="events" class="events">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Especialidades</h2>
					<p>Conoce nuestros platillos especiales</p>
				</div>

				<div class="events-slider swiper-container" data-aos="fade-up" data-aos-delay="100">
					<div class="swiper-wrapper">
						<!--Recorro todos los platillos para seleccionar solo aquellos que son especialidad-->
						<xsl:for-each select="Platillos/Tipo/Platillo[@Especialidad = 'SI']">
							<div class="swiper-slide">
								<div class="row event-item">
									<div class="col-lg-6">
										<!--Voy a inferir la imagen en su posicion 1-->
										<img src="{Imagen[position()=1]}" class="img-fluid" alt="{Imagen[position()=1]}"></img>
									</div>
									<div class="col-lg-6 pt-4 pt-lg-0 content">
										<h3>
											<!--Recuperamos el nombre del platillo-->
											<xsl:value-of select="@Nombre"/>
										</h3>
										<div class="price">
											<p>
												<span>
													<!--Recuperamos el precio del platillo-->
													<xsl:value-of select="Precio"/>
												</span>
											</p>
										</div>
										<p class="fst-italic">
											<!--Recuperamos el texto especial-->
											<xsl:value-of select="TextoEspecial"/>
										</p>
										<!--Ingredientes-->
										<div calss="col-lg-12">
											<!--Imagen-->
											<div class="col-lg-12">
												<div class="col-lg-6 pt-4 pt-lg-0 content">
													<h3>
														<!--Recuperamos el nombre de los ingredientes-->
														<xsl:value-of select="Ingredientes/Ingrediente[position() = 1]/@Nombre"/>
													</h3>
													<p>
														<!--Recuperamos el nombre de los ingredientes-->
														<xsl:value-of select="Ingredientes/Ingrediente[position() = 1]"/>
													</p>
												</div>
												<!--Inferimos la imagen en su posicion 1-->
												<img src="{Imagen[position()=2]}" class="img-fluid" alt="{Imagen[position()=2]}"></img>
											</div>
											<!--Textos-->
											<div class="col-lg-12">
												<div class="row event-item">
													<!--Recorrer el resto de ingredientes-->
													<xsl:for-each select="Ingredientes/Ingrediente[position()>1]">
														<div class="col-lg-6 pt-4 pt-lg-0 content">
															<h3>
																<!--Recuepramos el nombre de los ingredientes-->
																<xsl:value-of select="@Nombre"/>
															</h3>
															<p class="fst-italic">
																<!--Recuperamos el valor de los ingredientes-->
																<xsl:value-of select="Ingredientes/Ingrediente[position()=1]"/>
															</p>
															<p>
																<!--Inferimos la imagen en su posicion 1-->
																<img src="{@Imagen}" class="img-fluid" alt=""/>
															</p>
														</div>
													</xsl:for-each>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</xsl:for-each>
						<!-- End testimonial item -->

					</div>
					<div class="swiper-pagination"></div>
				</div>

			</div>
		</section>
		<!-- End Events Section -->

		<!-- ======= Specials Section ======= -->
		<section id="specials" class="specials">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Specials</h2>
					<p>Check Our Specials</p>
				</div>

				<div class="row" data-aos="fade-up" data-aos-delay="100">
					<div class="col-lg-3">
						<ul class="nav nav-tabs flex-column">
							<xsl:for-each select="Platillos/Tipo[@Nombre = 'Bebidas']/Platillo">
								<li class="nav-item">
									<xsl:choose>
										<xsl:when test="@Orden = 1">
											<!--El data-bs-toggle es el que te da la base del llamado, en este caso "tab"--> 
											<!--el {} es para ingresar un dato duro dentro de otra propiedad-->
											<a class="nav-link active show" data-bs-toggle="tab" href="#tab-{@Orden}">
												<xsl:value-of select="@Nombre"/>
											</a>
										</xsl:when>
										<xsl:otherwise>
											<a class="nav-link" data-bs-toggle="tab" href="#tab-{@Orden}">
												<xsl:value-of select="@Nombre"/>
											</a>
										</xsl:otherwise>
									</xsl:choose>

								</li>
							</xsl:for-each>
						</ul>
					</div>

					<div class="col-lg-9 mt-4 mt-lg-0">
						<div class="tab-content">
							<xsl:for-each select="Platillos/Tipo[@Nombre = 'Bebidas']/Platillo">
								<xsl:choose>
									<xsl:when test="@Orden = 1">
										<div class="tab-pane active show" id="tab-{@Orden}">
											<div class="row">
												<div class="col-lg-8 details order-2 order-lg-1">
													<h3>
														<xsl:value-of select="@Nombre"/>
													</h3>
													<p class="fst-italic">
														<xsl:value-of select="Precio"/>
													</p>
													<p>
														<xsl:value-of select="Descripcion"/>

													</p>
												</div>
												<div class="col-lg-4 text-center order-1 order-lg-2">
													<img src="{Imagen}" alt="" class="img-fluid"></img>
												</div>
											</div>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<div class="tab-pane" id="tab-{@Orden}">
											<div class="row">
												<div class="col-lg-8 details order-2 order-lg-1">
													<h3>
														<xsl:value-of select="@Nombre"/>
													</h3>
													<p class="fst-italic">
														<xsl:value-of select="Precio"/>
													</p>
													<p>
														<xsl:value-of select="Descripcion"/>

													</p>
												</div>
												<div class="col-lg-4 text-center order-1 order-lg-2">
													<img src="{Imagen}" alt="" class="img-fluid"></img>
												</div>
											</div>
										</div>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</div>
					</div>
				</div>

			</div>
		</section>
		<!-- End Specials Section -->

	</xsl:template>
	<xsl:template name="Carta">
		<h1>Hola desde Carta</h1>
	</xsl:template>
	<xsl:template name="Contacto">
		<h1>Hola desde Contacto</h1>
	</xsl:template>
	<xsl:template name="PlayRomm">
		<h1>Hola desde PlayRoom</h1>
	</xsl:template>

</xsl:stylesheet>
