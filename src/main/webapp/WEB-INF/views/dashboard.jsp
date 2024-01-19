<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix= "fmt" uri= "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<!-- header -->

<head>
	<meta charset="ISO-8859-1" name="viewport" content="width=device-width initial-scale=1.0">
	<title>NurseBulletin</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/main.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
</head>

<body >
<header>
	<nav x-data="{ isOpen: false }" class="relative bg-white shadow shadow-white dark:bg-gray-800">
		<div class="container  px-6 py-4 mx-auto">
			<div class="lg:flex lg:items-center lg:justify-between ">
				<div class="flex items-center justify-between">
					<a class=" px-3 py-2 text-white text-2xl transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700" href="/">
						<img class="w-22 h-22 sm:h-8 " src="/assets/nursebulletin-transparent.png" alt="">
					</a>

					<!-- Mobile menu button -->
					<div class="flex lg:hidden">
						<button x-cloak @click="isOpen = !isOpen" type="button" class="text-gray-500 dark:text-gray-200 hover:text-gray-600 dark:hover:text-gray-400 focus:outline-none focus:text-gray-600 dark:focus:text-gray-400" aria-label="toggle menu">
							<svg x-show="!isOpen" xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
								<path stroke-linecap="round" stroke-linejoin="round" d="M4 8h16M4 16h16" />
							</svg>

							<svg x-show="isOpen" xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
								<path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
							</svg>
						</button>
					</div>
				</div>

				<!-- Mobile Menu open: "block", Menu closed: "hidden" -->

				<c:choose>
					<c:when test="${not empty sessionScope.userId}">
						<c:choose>
							<c:when test="${not empty user.profilePicture and fn:length(user.profilePicture) != 2 }">
								<!-- large screens -->
								<div x-cloak :class="[isOpen ? 'translate-x-0 opacity-100 ' : 'opacity-0 -translate-x-full']" class="absolute inset-x-0 z-20 w-full px-6 py-4 transition-all duration-300 ease-in-out bg-white dark:bg-gray-800 lg:mt-0 lg:p-0 lg:top-0 lg:relative lg:bg-transparent lg:w-auto lg:opacity-100 lg:translate-x-0 lg:flex lg:items-center">
									<div class="flex items-center mt-4 lg:mt-0">
										<div class="flex flex-col -mx-6 lg:flex-row lg:items-center lg:mx-8 lg:relative">
											<a href="/" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Home</a>
											<a href="/review/allReviews" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Reviews</a>
											<a href="/hospitals/allHospitals" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Hospitals</a>
											<a href="/discussion/allDiscussions" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Forums</a>
											<div x-data="{ isOpen: false }" class="relative inline-block">
												<!-- Dropdown toggle button -->
												<button @click="isOpen = !isOpen" class="ml-3 relative z-10 flex items-center p-2 text-sm text-gray-600 bg-white border border-transparent rounded-md focus:border-blue-500 focus:ring-opacity-40 dark:focus:ring-opacity-40 focus:ring-blue-300 dark:focus:ring-blue-400 focus:ring dark:text-white dark:bg-gray-800 focus:outline-none">
													<span class="mx-1"> <i class="fa-solid  <c:out value="${ user.profilePicture }"></c:out>"></i>  </span>
													<svg class="w-5 h-5 mx-1" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
														<path d="M12 15.713L18.01 9.70299L16.597 8.28799L12 12.888L7.40399 8.28799L5.98999 9.70199L12 15.713Z" fill="currentColor"></path>
													</svg>
												</button>

												<!-- Dropdown menu -->
												<div x-show="isOpen"
													 @click.away="isOpen = false"
													 x-transition:enter="transition ease-out duration-100"
													 x-transition:enter-start="opacity-0 scale-90"
													 x-transition:enter-end="opacity-100 scale-100"
													 x-transition:leave="transition ease-in duration-100"
													 x-transition:leave-start="opacity-100 scale-100"
													 x-transition:leave-end="opacity-0 scale-90"
													 class="absolute z-20 w-56 py-2 mt-2 overflow-hidden origin-top-right bg-white rounded-md shadow-xl dark:bg-gray-800 sm:left-0 md:left-0 lg:left-auto lg:right-0 xl:right-0 2xl:right-0"
												>
													<a href="/dashboard" class="flex items-center p-3 -mt-2 text-sm text-gray-600 transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														<span class="mx-3"> <i class="fa-solid  <c:out value="${ user.profilePicture }"></c:out>"></i>  </span>
														<div class="mx-1">
															<h1 class="text-sm font-semibold text-gray-700 dark:text-gray-200"> <c:out value="${ user.firstName } ${ user.lastName }"></c:out> </h1>
															<p class="text-sm text-gray-500 dark:text-gray-400"> <c:out value="${user.email}"></c:out> </p>
														</div>
													</a>
													<hr class="border-gray-200 dark:border-gray-700 ">
													<a href="/dashboard" class="block px-4 py-3 text-sm text-gray-600 capitalize transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														Dashboard
													</a>
													<a href="/discussion/allDiscussions" class="block px-4 py-3 text-sm text-gray-600 capitalize transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														Forums
													</a>
													<hr class="border-gray-200 dark:border-gray-700 ">
													<a href="/review/new" class="block px-4 py-3 text-sm text-gray-600 capitalize transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														Add review
													</a>
													<a href="/user/edit/<c:out value="${user.id}"></c:out> " class="block px-4 py-3 text-sm text-gray-600 capitalize transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														Edit profile
													</a>
													<hr class="border-gray-200 dark:border-gray-700 ">
													<a href="/user/logout" class="block px-4 py-3 text-sm text-gray-600 capitalize transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														Sign Out
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div x-cloak :class="[isOpen ? 'translate-x-0 opacity-100 ' : 'opacity-0 -translate-x-full']" class="absolute inset-x-0 z-20 w-full px-6 py-4 transition-all duration-300 ease-in-out bg-white dark:bg-gray-800 lg:mt-0 lg:p-0 lg:top-0 lg:relative lg:bg-transparent lg:w-auto lg:opacity-100 lg:translate-x-0 lg:flex lg:items-center">
									<div class="flex items-center mt-4 lg:mt-0 lg:relative">
										<div class="flex flex-col -mx-6 lg:flex-row lg:items-center lg:mx-8 lg:relative">
											<a href="/" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Home</a>
											<a href="/review/allReviews" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Reviews</a>
											<a href="/hospitals/allHospitals" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Hospitals</a>
											<a href="/discussion/allDiscussions" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Forums</a>
											<div x-data="{ isOpen: false }" class="relative inline-block ">
												<!-- Dropdown toggle button -->
												<button @click="isOpen = !isOpen" class="ml-3 relative z-10 flex items-center p-2 text-sm text-gray-600 bg-white border border-transparent rounded-md focus:border-blue-500 focus:ring-opacity-40 dark:focus:ring-opacity-40 focus:ring-blue-300 dark:focus:ring-blue-400 focus:ring dark:text-white dark:bg-gray-800 focus:outline-none">
																<span class="mx-1">
																	<c:out value="${ fn:substring(sessionScope.cappedFirstNameUser.firstName, 0, 1).toUpperCase() }${ fn:substring(sessionScope.cappedFirstNameUser.lastName, 0,1).toUpperCase()}"></c:out>
																</span>
													<svg class="w-5 h-5 mx-1" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
														<path d="M12 15.713L18.01 9.70299L16.597 8.28799L12 12.888L7.40399 8.28799L5.98999 9.70199L12 15.713Z" fill="currentColor"></path>
													</svg>
												</button>

												<!-- Dropdown menu -->
												<div x-show="isOpen"
													 @click.away="isOpen = false"
													 x-transition:enter="transition ease-out duration-100"
													 x-transition:enter-start="opacity-0 scale-90"
													 x-transition:enter-end="opacity-100 scale-100"
													 x-transition:leave="transition ease-in duration-100"
													 x-transition:leave-start="opacity-100 scale-100"
													 x-transition:leave-end="opacity-0 scale-90"
													 class="absolute z-20 w-56 py-2 mt-2 overflow-hidden origin-top-right bg-white rounded-md shadow-xl dark:bg-gray-800 sm:left-0 md:left-0 lg:left-auto lg:right-0 xl:right-0 2xl:right-0"
												>
													<a href="/dashboard" class="flex items-center p-3 -mt-2 text-sm text-gray-600 transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														<c:if test="${fn:length(user.profilePicture) == 2 || empty user.profilePicture}">
															<p>
																<c:out value="${ fn:substring(sessionScope.cappedFirstNameUser.firstName, 0, 1).toUpperCase() }${ fn:substring(sessionScope.cappedFirstNameUser.lastName, 0,1).toUpperCase()}"></c:out>
															</p>
														</c:if>
														<span class="mx-3"> <i class="fa-solid  <c:out value="${ user.profilePicture }"></c:out>"></i>  </span>
														<div class="mx-1">
															<h1 class="text-sm font-semibold text-gray-700 dark:text-gray-200"> <c:out value="${ user.firstName } ${ user.lastName }"></c:out> </h1>
															<p class="text-sm text-gray-500 dark:text-gray-400"> <c:out value="${user.email}"></c:out> </p>
														</div>
													</a>
													<hr class="border-gray-200 dark:border-gray-700 ">
													<a href="/dashboard" class="block px-4 py-3 text-sm text-gray-600 capitalize transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														Dashboard
													</a>
													<a href="/discussion/allDiscussions" class="block px-4 py-3 text-sm text-gray-600 capitalize transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														Forums
													</a>
													<hr class="border-gray-200 dark:border-gray-700 ">
													<a href="/review/new" class="block px-4 py-3 text-sm text-gray-600 capitalize transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														Add review
													</a>
													<a href="/user/edit/<c:out value="${user.id}"></c:out> " class="block px-4 py-3 text-sm text-gray-600 capitalize transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														Edit profile
													</a>
													<hr class="border-gray-200 dark:border-gray-700 ">
													<a href="/user/logout" class="block px-4 py-3 text-sm text-gray-600 capitalize transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														Sign Out
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<div x-cloak :class="[isOpen ? 'translate-x-0 opacity-100 ' : 'opacity-0 -translate-x-full']" class="absolute inset-x-0 z-20 w-full px-6 py-4 transition-all duration-300 ease-in-out bg-white dark:bg-gray-800 lg:mt-0 lg:p-0 lg:top-0 lg:relative lg:bg-transparent lg:w-auto lg:opacity-100 lg:translate-x-0 lg:flex lg:items-center">
							<div class="flex items-center mt-4 lg:mt-0 lg:relative">
								<div class="flex flex-col -mx-6 lg:flex-row lg:items-center lg:mx-8">
									<a href="/" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Home</a>
									<a href="/review/allReviews" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Reviews</a>
									<a href="/hospitals/allHospitals" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Hospitals</a>
									<a href="/discussion/allDiscussions" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Forums</a>
									<div class="flex items-center gap-2 mx-6 my-2">
										<a id="bg-color-login" class="px-6 py-2 font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-blue-600 rounded-lg hover:bg-blue-500 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-80" href="/user/login" >Log in</a>
										<a class="px-6 py-2 font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-blue-600 rounded-lg hover:bg-blue-500 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-80"  href="/user/register" >Join NurseBulletin</a>
									</div>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		</div>
		</div>
	</nav>
</header>
<main class="bg-white dark:bg-gray-900 text-white">
	<section class="dark:bg-gray-800 dark:text-gray-50">
		<div class="container grid grid-cols-12 mx-auto">
			<div class="flex flex-col justify-center col-span-12 align-middle bg-no-repeat bg-cover dark:bg-gray-700 lg:col-span-6 lg:h-auto" style="background-image: url('https://source.unsplash.com/random/640x480'); background-position: center center; background-blend-mode: multiply; background-size: cover;">
				<div class="flex flex-col items-center p-8 py-12 text-center">
					<h1 class="py-4 text-5xl font-bold dark:dark:text-violet-400" >
						Hello @<c:out value="${user.username}"></c:out>!
					</h1>
					<p class="pb-6">Welcome to NurseBulletin. On this page there are sections showing you reviews you have written, hospitals that are "hot",
						actively getting lots of reviews, and other quick links. Feel free to search the site. We recommend you head to the forums section if you
						have any questions.
					</p>

				</div>
			</div>
			<div class="flex flex-col col-span-12 p-6 divide-y lg:col-span-6 lg:p-10 dark:divide-gray-700">
				<div class="pt-6 pb-4 space-y-2">
					<h1 class="text-3xl font-bold dark:dark:text-violet-400">Hospitals you have reviewed</h1>
					<c:choose>
						<c:when test="${ fn:length(noDuplicates) > 0 }">
							<div id=reviewed-hospitals-div class="reviews-col">
								<c:forEach var="eachHospitalName" items="${ noDuplicates }">
									<div>
										<ul class="list-inside transition-colors duration-300 transform hover:text-blue-500 focus:underline focus:ring focus:ring-blue-300 focus:ring-opacity-80">

											<li>
												<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-4 h-4 inline-flex">
													<path fill-rule="evenodd" d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd"></path>
												</svg>
												<a href="/hospitals/view/<c:out value="${eachHospitalName.id}"></c:out> ">
													<c:out value="${ eachHospitalName.hospitalName}  |  ${ eachHospitalName.city }, ${ eachHospitalName.state }"></c:out>
												</a>
											</li>
										</ul>
									</div>
								</c:forEach>
							</div>
						</c:when>
						<c:otherwise>
							<span class="text-sm font-light text-gray-600 dark:text-gray-400 inline-flex items-center ">
								You have not reviewed any hospitals yet.
								Click here to review a hospital:
							</span>
							<a type="button" class="md:mx-2 px-4 py-2 font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-blue-600 rounded-lg hover:bg-blue-500 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-80"
							   href="/review/new" >
								Review hospitals
							</a>
						</c:otherwise>
					</c:choose>
					<a rel="noopener noreferrer" href="/hospitals/allHospitals" class="inline-flex items-center py-2 space-x-2 text-sm dark:text-violet-400 transition-colors hover:dark:text-blue-500 duration-300 transform focus:underline focus:ring focus:ring-blue-300 focus:ring-opacity-80">
						<span class="">Search all hospitals</span>
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-4 h-4">
							<path fill-rule="evenodd" d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd"></path>
						</svg>
					</a>
				</div>
				<div class="pt-6 pb-4 space-y-2">
					<h1 class="text-3xl font-bold dark:dark:text-violet-400">Links to most reviewed hospitals</h1>
					<div>
						<c:forEach var="eachEntry" items="${ hospitalReviewCountsSorted }">
							<ul class="list-inside transition-colors duration-300 transform hover:text-blue-500 focus:underline focus:ring focus:ring-blue-300 focus:ring-opacity-80">
								<li>
									<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-4 h-4 inline-flex">
										<path fill-rule="evenodd" d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd"></path>
									</svg>
									<a href="/hospitals/view/${ eachEntry.key.id }">
										<c:out value="${ eachEntry.key.hospitalName }"></c:out>
										(<c:out value="${ eachEntry.value }"></c:out>)
									</a>
								</li>
							</ul>
						</c:forEach>
					</div>
					<a rel="noopener noreferrer" href="/hospitals/allHospitals" class="inline-flex items-center py-2 space-x-2 text-sm dark:text-violet-400 transition-colors hover:dark:text-blue-500 duration-300 transform focus:underline focus:ring focus:ring-blue-300 focus:ring-opacity-80">
						<span>Search all hospitals</span>
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-4 h-4">
							<path fill-rule="evenodd" d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd"></path>
						</svg>
					</a>
				</div>
				<div class="pt-6 pb-4 space-y-2">
					<h1 class="text-3xl font-bold dark:dark:text-violet-400">Your reviews</h1>
					<section class="max-w-3xl mx-auto h-auto max-h-96 overflow-scroll my-6 overflow-x-auto [&::-webkit-scrollbar]:w-2
									[&::-webkit-scrollbar-track]:rounded-full
									[&::-webkit-scrollbar-track]:bg-gray-100
									[&::-webkit-scrollbar-thumb]:rounded-full
									[&::-webkit-scrollbar-thumb]:bg-gray-300
									dark:[&::-webkit-scrollbar-track]:bg-gray-800
									dark:[&::-webkit-scrollbar-thumb]:bg-slate-500">
						<c:choose>
							<c:when test="${ not empty userReviews }">
								<c:forEach items="${ userReviews }" var="review">
									<div id="resultsSection" class="max-w-2xl px-8 py-4 my-6 bg-white rounded-lg shadow-md dark:bg-gray-700">
										<div class=" review-card">
											<div class="md:flex items-center justify-between hospitalname-city">
												<h2 class="block md:inline text-xl text-left font-bold dark:dark:text-violet-400"><c:out value="${ review.hospital.hospitalName }"></c:out> </h2>
												<h3 class="block md:inline text-sm text-left font-light text-gray-600 dark:text-gray-400" ><c:out value="${ review.hospital.city }, ${ review.hospital.state }"></c:out>  </h3>
											</div>
											<div class="mt-2">
												<p class="text-left text-lg text-gray-700 dark:text-white">"${ review.title.toUpperCase() }"</p>
											</div>
											<p class="text-left mt-2">
												<b>Unit:</b> ${ review.unitWorkedAt.toUpperCase() }
											</p>
											<p class="text-left mt-2">
												<b>Summary: </b>"${ review.content }"
											</p>
											<div class="block md:flex items-center justify-between mt-4">
												<p class="block text-left">
													<b>Created:</b> ${ review.getFormattedDate() }
												</p>
												<div class="block md:flex items-center center-container">
													<a type="button" class="block md:mx-2 lg:mx-2 my-2 py-2 px-4 font-semibold rounded dark:dark:bg-violet-400 dark:dark:text-gray-900 duration-300 hover:bg-violet-300" href="/review/view/${review.id}" >More Info</a>
													<a type="button" class="block py-2 px-4 font-semibold rounded dark:dark:bg-violet-400 dark:dark:text-gray-900 duration-300 hover:bg-violet-300" href="/hospitals/view/${review.hospital.id }">Hospital Info</a>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
											<span class="text-sm font-light text-gray-600 dark:text-gray-400 inline-flex items-center ">
												You have not created any reviews yet.
												Click here to review a hospital:

											</span>
								<a type="button" class=" md:mx-2 px-4 py-2 font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-blue-600 rounded-lg hover:bg-blue-500 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-80"
								   href="/review/new" >
									Review hospitals
								</a>
							</c:otherwise>
						</c:choose>
						<a rel="noopener noreferrer" href="/review/allReviews" class="mx-2 md:mx-0 inline-flex items-center py-2 space-x-2 text-sm dark:text-violet-400 transition-colors hover:dark:text-blue-500 duration-300 transform focus:underline focus:ring focus:ring-blue-300 focus:ring-opacity-80">
							<span>Search all reviews</span>
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-4 h-4">
								<path fill-rule="evenodd" d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd"></path>
							</svg>
						</a>
					</section>
				</div>
			</div>
		</div>
<%--		<section class="py-6 dark:bg-gray-800 dark:text-gray-50">--%>
<%--			<div class="container grid grid-cols-2 gap-4 p-4 mx-auto md:grid-cols-4">--%>
<%--				<img src="https://source.unsplash.com/random/301x301/" alt="" class="w-full h-full col-span-2 row-span-2 rounded shadow-sm min-h-96 md:col-start-3 md:row-start-1 dark:bg-gray-500 aspect-square">--%>
<%--				<div class="w-full h-full rounded shadow-sm min-h-48 dark:bg-gray-500 aspect-square" src="https://source.unsplash.com/random/200x200/?0">--%>
<%--					<h3>test</h3>--%>
<%--				</div>--%>
<%--				<img alt="" class="w-full h-full rounded shadow-sm min-h-48 dark:bg-gray-500 aspect-square" src="https://source.unsplash.com/random/200x200/?1">--%>
<%--				<img alt="" class="w-full h-full rounded shadow-sm min-h-48 dark:bg-gray-500 aspect-square" src="https://source.unsplash.com/random/200x200/?2">--%>
<%--				<img alt="" class="w-full h-full rounded shadow-sm min-h-48 dark:bg-gray-500 aspect-square" src="https://source.unsplash.com/random/200x200/?7">--%>
<%--				<img src="https://source.unsplash.com/random/302x302/" alt="" class="w-full h-full col-span-2 row-span-2 rounded shadow-sm min-h-96 md:col-start-1 md:row-start-3 dark:bg-gray-500 aspect-square">--%>
<%--			</div>--%>
<%--		</section>--%>
		<section class="dark:bg-gray-800 dark:text-gray-100">
			<div class="container px-6 py-12 mx-auto">
				<h2 class="py-4 text-5xl font-bold dark:dark:text-violet-400 text-center mb-2">Most recent reviews posted by others</h2>
				<div class="grid items-center gap-4 xl:grid-cols-5">
					<div class="xl:col-span-3">
						<div class="grid gap-4 md:grid-cols-2">
							<div class="grid content-center gap-4">
								<div class="p-6 rounded shadow-md dark:bg-gray-900">
									<p>An audire commodo habemus cum. Ne sed corrumpit repudiandae. Tota aliquip democritum pro in, nec democritum intellegam ne. Propriae volutpat dissentiet ea sit, nec at lorem inani tritani, an ius populo perfecto vituperatoribus. Eu cum case modus salutandi, ut eum vocent sensibus reprehendunt.</p>
									<div class="flex items-center mt-4 space-x-4">
										<img src="https://source.unsplash.com/50x50/?portrait?1" alt="" class="w-12 h-12 bg-center bg-cover rounded-full dark:bg-gray-500">
										<div>
											<p class="text-lg font-semibold">Leroy Jenkins</p>
											<p class="text-sm dark:text-gray-400">CTO of Company Co.</p>
										</div>
									</div>
								</div>
								<div class="p-6 rounded shadow-md dark:bg-gray-900">
									<p>Sit wisi sapientem ut, pri civibus temporibus voluptatibus et, ius cu hinc fabulas. Nam meliore minimum et, regione convenire cum id. Ex pro eros mucius consectetuer, pro magna nulla nonumy ne, eam putent iudicabit consulatu cu.</p>
									<div class="flex items-center mt-4 space-x-4">
										<img src="https://source.unsplash.com/50x50/?portrait?2" alt="" class="w-12 h-12 bg-center bg-cover rounded-full dark:bg-gray-500">
										<div>
											<p class="text-lg font-semibold">Leroy Jenkins</p>
											<p class="text-sm dark:text-gray-400">CTO of Company Co.</p>
										</div>
									</div>
								</div>
							</div>
							<div class="grid content-center gap-4">
								<div class="p-6 rounded shadow-md dark:bg-gray-900">
									<p>Putant omnium elaboraret per ut. Id dicta tritani nominavi quo, mea id justo errem elaboraret. Agam mollis scripserit ea his, ut nec postea verear persecuti. Ea noster senserit eam, ferri omittantur ei nec. Id mel solet libris efficiantur, commune explicari et eos. Case movet ad est, sed tota vocent appetere ea.</p>
									<div class="flex items-center mt-4 space-x-4">
										<img src="https://source.unsplash.com/50x50/?portrait?3" alt="" class="w-12 h-12 bg-center bg-cover rounded-full dark:bg-gray-500">
										<div>
											<p class="text-lg font-semibold">Leroy Jenkins</p>
											<p class="text-sm dark:text-gray-400">CTO of Company Co.</p>
										</div>
									</div>
								</div>
								<div class="p-6 rounded shadow-md dark:bg-gray-900">
									<p>Te omnes virtute volutpat sed. Ei esse eros interesset vel, ei populo denique ocurreret vix, eu cum pertinax mandamus vituperatoribus. Solum nihil luptatum per ex, ei amet viderer eos. Ea illum labitur mnesarchum pro. Eius meis salutandi ei nam, alterum expetenda et nec. Expetenda intellegat at eum, per mazim sanctus honestatis ad. Ei noluisse invenire vix. Te ancillae patrioque qui, probo bonorum vivendum ex vim.</p>
									<div class="flex items-center mt-4 space-x-4">
										<img src="https://source.unsplash.com/50x50/?portrait?4" alt="" class="w-12 h-12 bg-center bg-cover rounded-full dark:bg-gray-500">
										<div>
											<p class="text-lg font-semibold">Leroy Jenkins</p>
											<p class="text-sm dark:text-gray-400">CTO of Company Co.</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="xl:col-span-2">
						<div class="grid gap-4 md:grid-cols-1 ">
							<!-- this one -->
							<div class="container grid grid-cols-1 mx-auto">
								<div class="w-full justify-center align-middle bg-no-repeat bg-cover dark:bg-gray-700 lg:col-span-6 lg:h-auto" style="background-image: url('https://source.unsplash.com/random/640x480/?nature'); background-position: center center; background-blend-mode: multiply; background-size: cover;">
									<div class="flex flex-col items-center p-8 py-12 text-center">
										<h2 class="text-4xl font-bold mb-4">Did you know?</h2>
										<p class="dark:text-gray-400 text-lg">
											These are the most recent reviews added to the site excluding your own reviews. Why did we do this? In case you needed inspiration
											to determine where you might want to travel to next, maybe someone's review could help you in that decision.
										</p>
										<a rel="noopener noreferrer" href="#" class="mt-4 inline-flex items-center space-x-2 text-lg dark:text-violet-400 transition-colors hover:dark:text-blue-500 duration-300 transform focus:underline focus:ring focus:ring-violet-400 focus:ring-opacity-80">
											<span>To your reviews</span>
											<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-4 h-4">
												<path fill-rule="evenodd" d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd"></path>
											</svg>
										</a>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- last line is the one above -->
	</section>
</main>
<!-- footer -->

<!-- ========== END MAIN CONTENT ========== -->
<script src="${pageContext.request.contextPath}../node_modules/preline/dist/preline.js"></script>
<script src="/js/script.js"></script>
<script src="https://kit.fontawesome.com/eb2c2d28d2.js" crossorigin="anonymous"></script>
<footer class="bg-white dark:bg-gray-900">
	<div class="container px-6 py-8 mx-auto">
		<div class="flex flex-col items-center text-center">
			<a href="#">
				<h2 class=" px-3 py-2 text-white text-2xl transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700" href="/" >
					<img class="w-22 h-22 sm:h-8 " src="/assets/nursebulletin-transparent.png" alt="">
				</h2>
			</a>

			<div class="flex flex-wrap justify-center mt-6 -mx-4">
				<a href="/" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700" aria-label="Reddit"> Home </a>

				<a href="/review/allReviews" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700" aria-label="Reddit"> Reviews </a>

				<a href="hospitals/allHospitals" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700" aria-label="Reddit"> Hospitals </a>

				<a href="/discussion/allDiscussions" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700" aria-label="Reddit"> Forums </a>

				<a href="#" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700" aria-label="Reddit"> Terms of use </a>
			</div>

		</div>

		<hr class="my-6 border-gray-200 md:my-10 dark:border-gray-700" />

		<div class="flex flex-col items-center sm:flex-row sm:justify-between">
			<p class="text-sm text-gray-500 dark:text-gray-300 ">© Copyright 2024. All Rights Reserved.</p>

			<div class="flex -mx-2 sm:my-4">
				<a href="https://www.tiktok.com/@itsthejourneylak" class="mx-2 text-gray-600 transition-colors duration-300 dark:text-gray-300 hover:text-blue-500 dark:hover:text-blue-400" aria-label="Tiktok">
					<svg fill="none" class="w-9 h-9 fill-current" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" xml:space="preserve"><path d="M19.589 6.686a4.793 4.793 0 0 1-3.77-4.245V2h-3.445v13.672a2.896 2.896 0 0 1-5.201 1.743l-.002-.001.002.001a2.895 2.895 0 0 1 3.183-4.51v-3.5a6.329 6.329 0 0 0-5.394 10.692 6.33 6.33 0 0 0 10.857-4.424V8.687a8.182 8.182 0 0 0 4.773 1.526V6.79a4.831 4.831 0 0 1-1.003-.104z"/></svg>
				</a>

				<a href="https://www.linkedin.com/in/laz-alvarez/" class="mx-2 text-gray-600 transition-colors duration-300 dark:text-gray-300 hover:text-blue-500 dark:hover:text-blue-400" aria-label="Linkedin">
					<i class="fa-brands fa-linkedin-in text-4xl  fill-current"></i>
				</a>

				<a href="https://github.com/thisislaz" class="mx-2 text-gray-600 transition-colors duration-300 dark:text-gray-300 hover:text-blue-500 dark:hover:text-blue-400" aria-label="Github">
					<svg class="w-9 h-9 fill-current" viewBox="0 0 24 24" fill="none"
						 xmlns="http://www.w3.org/2000/svg">
						<path
								d="M12.026 2C7.13295 1.99937 2.96183 5.54799 2.17842 10.3779C1.395 15.2079 4.23061 19.893 8.87302 21.439C9.37302 21.529 9.55202 21.222 9.55202 20.958C9.55202 20.721 9.54402 20.093 9.54102 19.258C6.76602 19.858 6.18002 17.92 6.18002 17.92C5.99733 17.317 5.60459 16.7993 5.07302 16.461C4.17302 15.842 5.14202 15.856 5.14202 15.856C5.78269 15.9438 6.34657 16.3235 6.66902 16.884C6.94195 17.3803 7.40177 17.747 7.94632 17.9026C8.49087 18.0583 9.07503 17.99 9.56902 17.713C9.61544 17.207 9.84055 16.7341 10.204 16.379C7.99002 16.128 5.66202 15.272 5.66202 11.449C5.64973 10.4602 6.01691 9.5043 6.68802 8.778C6.38437 7.91731 6.42013 6.97325 6.78802 6.138C6.78802 6.138 7.62502 5.869 9.53002 7.159C11.1639 6.71101 12.8882 6.71101 14.522 7.159C16.428 5.868 17.264 6.138 17.264 6.138C17.6336 6.97286 17.6694 7.91757 17.364 8.778C18.0376 9.50423 18.4045 10.4626 18.388 11.453C18.388 15.286 16.058 16.128 13.836 16.375C14.3153 16.8651 14.5612 17.5373 14.511 18.221C14.511 19.555 14.499 20.631 14.499 20.958C14.499 21.225 14.677 21.535 15.186 21.437C19.8265 19.8884 22.6591 15.203 21.874 10.3743C21.089 5.54565 16.9181 1.99888 12.026 2Z">
						</path>
					</svg>
				</a>
			</div>
		</div>
	</div>
</footer>
</body>

</html>