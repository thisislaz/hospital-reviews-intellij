<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix= "fmt" uri= "http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isErrorPage="true" %>
  
<!DOCTYPE html>
<html >
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
				<div x-cloak :class="[isOpen ? 'translate-x-0 opacity-100 ' : 'opacity-0 -translate-x-full']" class="absolute inset-x-0 z-20 w-full px-6 py-4 transition-all duration-300 ease-in-out bg-white dark:bg-gray-800 lg:mt-0 lg:p-0 lg:top-0 lg:relative lg:bg-transparent lg:w-auto lg:opacity-100 lg:translate-x-0 lg:flex lg:items-center">
					<div class="flex items-center mt-4 lg:mt-0">
						<c:choose>
							<c:when test="${not empty sessionScope.userId}">
								<c:choose>
									<c:when test="${not empty user.profilePicture and fn:length(user.profilePicture) != 2 }">
										<div class="flex flex-col -mx-6 lg:flex-row lg:items-center lg:mx-8">
											<a href="/" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Home</a>
											<a href="/review/allReviews" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Reviews</a>
											<a href="/hospitals/allHospitals" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Hospitals</a>
											<a href="/discussion/allDiscussions" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Forums</a>
											<div x-data="{ isOpen: false }" class="relative inline-block">
												<!-- Dropdown toggle button -->
												<button @click="isOpen = !isOpen" class=" ml-5 relative z-10 flex items-center p-2 text-sm text-gray-600 bg-white border border-transparent rounded-md focus:border-blue-500 focus:ring-opacity-40 dark:focus:ring-opacity-40 focus:ring-blue-300 dark:focus:ring-blue-400 focus:ring dark:text-white dark:bg-gray-800 focus:outline-none">
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
													 class="absolute sm:left-full sm:top-0 md:left-0 md:top-full lg:left-0 lg:top-full z-20 w-56 py-2 mt-2 origin-top-right bg-white rounded-md shadow-xl dark:bg-gray-800"
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
									</c:when>
									<c:otherwise>
									<div class="flex flex-col -mx-6 lg:flex-row lg:items-center lg:mx-8">
										<a href="/" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Home</a>
										<a href="/review/allReviews" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Reviews</a>
										<a href="/hospitals/allHospitals" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Hospitals</a>
										<a href="/discussion/allDiscussions" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Forums</a>
									</div>
									<div x-data="{ isOpen: false }" class="relative inline-block ">
											<!-- Dropdown toggle button -->
											<button @click="isOpen = !isOpen" class="relative z-10 flex items-center p-2 text-sm text-gray-600 bg-white border border-transparent rounded-md focus:border-blue-500 focus:ring-opacity-40 dark:focus:ring-opacity-40 focus:ring-blue-300 dark:focus:ring-blue-400 focus:ring dark:text-white dark:bg-gray-800 focus:outline-none">
												<span class="mx-1">
													<div class="flex items-center gap-x-6">
														<p class="">
															<c:out value="${ fn:substring(sessionScope.cappedFirstNameUser.firstName, 0, 1).toUpperCase() }${ fn:substring(sessionScope.cappedFirstNameUser.lastName, 0,1).toUpperCase()}"></c:out>
														</p>
													</div>
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
												 class="absolute right-0 z-20 w-56 py-2 mt-2 overflow-hidden origin-top-right bg-white rounded-md shadow-xl dark:bg-gray-800"
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
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
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
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</nav>
	</header>
	<section class="p-6 dark:dark:bg-gray-800 dark:dark:text-gray-100 ">
		<div class="container grid gap-6 mx-auto text-center lg:grid-cols-2 xl:grid-cols-5">
			<div class="w-full px-6 py-16 rounded-md sm:px-12 md:px-16 xl:col-span-2 dark:dark:bg-gray-900">
				<span class="block text-lg mb-2 dark:dark:text-violet-400">Hospital Reviewing System</span>
				<h1 class="text-5xl font-extrabold dark:dark:text-gray-50">Join now and review your latest assignment!!</h1>
				<p class="my-8">
					<span class="font-medium dark:dark:text-gray-50">Help fellow traveling nurses get a heads up on the situation they are heading into.</span> Don't worry we're on your side! The hospitals/agencies won't know who you are.
				</p>
				<a href="user/register" type="button" class="w-full py-4 px-6 font-semibold rounded dark:dark:bg-violet-400 dark:dark:text-gray-900 duration-300 hover:bg-violet-300">Join the nurse revolution</a>
				<p class="my-8">
					<span class="font-medium dark:dark:text-gray-50">Already joined?</span>
					<a href="user/login" class="link link-info">Log in</a>
				</p>
			</div>
			<img src="${pageContext.request.contextPath}/assets/nurse_khan.jpg" alt="" class="object-cover w-full rounded-md xl:col-span-3 dark:dark:bg-gray-500">
		</div>

	</section>
		<main>
			<section class="bg-white dark:bg-gray-900">
				<div class="container px-6 py-10 mx-auto">
					<h2 class="text-2xl font-semibold text-center text-gray-800 capitalize lg:text-3xl dark:text-white"> The best way to know facts about hospitals you have worked at that are not found anywhere else. </h2>

					<p class="mt-4 text-center text-gray-500 dark:text-gray-300">
						Here at the NurseBulletin, we listen to our nurses,
						and let you inform others on certain topics about the hospital,
						so you don't have to wait an extended amount of time to hear it from your recruiter, allowing you
						to make quick decisions.
					</p>


					<div class="grid grid-cols-1 gap-8 mt-8 xl:mt-12 xl:gap-12 md:grid-cols-2 xl:grid-cols-3">
						<div class="overflow-hidden bg-cover rounded-lg cursor-pointer h-96 group"
							 style="background-image:url('/assets/cartoon_nurse.jpg')">
							<div
									class="flex flex-col justify-center w-full h-full px-8 py-4 transition-opacity duration-700 opacity-0 backdrop-blur-sm bg-gray-800/60 group-hover:opacity-100">
								<h2 class="mt-4 text-xl font-semibold text-white capitalize">Create your account</h2>
								<p class="mt-2 text-lg tracking-wider text-blue-400 uppercase ">Create your account so you can review multiple facilities</p>
							</div>
						</div>

						<div class="overflow-hidden bg-cover rounded-lg cursor-pointer h-96 group"
							 style="background-image:url('/assets/paperwork_nurse.jpg')">
							<div
									class="flex flex-col justify-center w-full h-full px-8 py-4 transition-opacity duration-700 opacity-0 backdrop-blur-sm bg-gray-800/60 group-hover:opacity-100">
								<h2 class="mt-4 text-xl font-semibold text-white capitalize">Create reviews on past experiences</h2>
								<p class="mt-2 text-lg tracking-wider text-blue-400 uppercase ">Create reviews on your past experiences and search our database of reviews.</p>
							</div>
						</div>

						<div class="overflow-hidden bg-cover rounded-lg cursor-pointer h-96 group"
							 style="background-image:url('/assets/cartoon_hospital.jpg')">
							<div
									class="flex flex-col justify-center w-full h-full px-8 py-4 transition-opacity duration-700 opacity-0 backdrop-blur-sm bg-gray-800/60 group-hover:opacity-100">
								<h2 class="mt-4 text-xl font-semibold text-white capitalize">Browse our database of US hospitals</h2>
								<p class="mt-2 text-lg tracking-wider text-blue-400 uppercase ">Check out all the reviews we have on certain hospitals across the US.</p>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section class="bg-white dark:bg-gray-900">
				<div class="items-center w-full px-5 py-24 mx-auto md:px-12 lg:px-16 max-w-7xl">
					<div class="text-left">
						<div class="items-center mx-auto lg:inline-flex">
							<div class="grid grid-cols-1 gap-6 lg:grid-cols-2 lg:gap-24">
								<div>
									<p class="text-2xl font-medium tracking-tight text-white sm:text-4xl">
										What other nurses are saying
									</p>
								</div>
								<div class="lg:ml-auto">
									<p class="mt-4 text-lg tracking-tight text-gray-600 lg:mt-0">
										Each nurse is encouraged to be as truthful as possible so other fellow nurses have accurate information.
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="relative items-center w-full mx-auto mt-12">
						<section class="h-max sm:h-160 p-6 dark:dark:bg-gray-800 dark:dark:text-gray-100">
								<div class="relative h-56 overflow-scroll rounded-lg md:h-96 flex flex-col gap-6">
									<c:forEach var="eachReview" items="${ reviewList }" varStatus="status">
											<div class="container flex flex-col w-full max-w-lg p-6 mx-auto divide-y rounded-md dark:divide-gray-700 dark:bg-gray-900 dark:text-gray-100">
												<div class="flex justify-between p-4">
													<span class="text-xl font-thin"> <c:out value="${eachReview.hospital.hospitalName}"></c:out> - <c:out value="${eachReview.hospital.city}, ${eachReview.hospital.state}"></c:out> </span>
												</div>
												<div class="flex justify-between p-4">
													<div class="flex space-x-4 items-center">
															<c:choose>
																<c:when test="${fn:length(eachReview.author.profilePicture) != 2 && not empty eachReview.author.profilePicture }">
																	<i class="fa-solid text-xl <c:out value="${ eachReview.author.profilePicture }"></c:out> "></i>
																</c:when>
																<c:when test="${fn:length(eachReview.author.profilePicture) == 2 || eachReview.author.profilePicture == null}">
																	<p class="text-xl">
																		<c:out value="${ fn:substring(eachReview.author.firstName, 0, 1).toUpperCase() }${ fn:substring(eachReview.author.lastName, 0,1).toUpperCase()}"></c:out>
																	</p>
																</c:when>
															</c:choose>
														<h4 class="font-bold text-xl font-light">  <c:out value="${fn:toUpperCase(eachReview.author.username)}"></c:out> </h4>
															<span class="text-xs dark:text-gray-400">
																 <c:out value="${timeSincePosted[reviewList.indexOf(eachReview)]}"></c:out>
															</span>
													</div>

													<div class="flex items-center space-x-2 dark:text-yellow-500 ">
														<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="w-5 h-5 fill-current">
															<path d="M494,198.671a40.536,40.536,0,0,0-32.174-27.592L345.917,152.242,292.185,47.828a40.7,40.7,0,0,0-72.37,0L166.083,152.242,50.176,171.079a40.7,40.7,0,0,0-22.364,68.827l82.7,83.368-17.9,116.055a40.672,40.672,0,0,0,58.548,42.538L256,428.977l104.843,52.89a40.69,40.69,0,0,0,58.548-42.538l-17.9-116.055,82.7-83.368A40.538,40.538,0,0,0,494,198.671Zm-32.53,18.7L367.4,312.2l20.364,132.01a8.671,8.671,0,0,1-12.509,9.088L256,393.136,136.744,453.3a8.671,8.671,0,0,1-12.509-9.088L144.6,312.2,50.531,217.37a8.7,8.7,0,0,1,4.778-14.706L187.15,181.238,248.269,62.471a8.694,8.694,0,0,1,15.462,0L324.85,181.238l131.841,21.426A8.7,8.7,0,0,1,461.469,217.37Z"></path>
														</svg>
														<span class="text-xl font-bold" > <c:out value="${eachReview.managementRating}"></c:out> </span>

													</div>
												</div>
												<div class="p-4 space-y-2 text-sm dark:text-gray-400">
													<p><b>Unit:</b> <c:out value="${ eachReview.unitWorkedAt }"></c:out> </p>
													<p><b>Summary:</b> <c:out value="${ eachReview.content }"></c:out> </p>
													<p><b>Posted:</b> <c:out value="${ eachReview.formattedDate }"></c:out> </p>
												</div>
												<a class="px-6 py-2 ml-3 md:w-1/2 sm:w-26 lg:w-1/3 font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-blue-600 rounded-lg hover:bg-blue-500 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-80" href="/review/view/<c:out value="${eachReview.id}"></c:out> " >View Review</a>
											</div>
									</c:forEach>
								</div>
						</section>
					</div>

					<div>
						<div class="pt-12 mx-auto lg:max-w-7xl">
							<div class="grid grid-cols-1 gap-6 space-y-0 lg:gap-24 lg:grid-cols-3">
								<div>
									<div>
										<p class="text-lg font-medium leading-6 text-white">
											Community-Powered Platform
										</p>
									</div>
									<div class="mt-2 text-base text-gray-500">
										Our platform is built with the community in mind, offering an interactive
										environment where nurses can share honest reviews and insights about hospitals,
										enhancing the collective knowledge of the nursing community. We ensure a seamless
										and engaging user experience, fostering a sense of trust and reliability.
									</div>
								</div>
								<div>
									<div>
										<p class="text-lg font-medium leading-6 text-white">
											Knowledge Sharing Hub
										</p>
									</div>
									<div class="mt-2 text-base text-gray-500">
										Our website's design prioritizes ease of use and accessibility, allowing nurses to quickly
										find and share information. With features like hospital reviews, discussion forums,
										and an intuitive search function, we cater to the dynamic needs of the nursing community.
									</div>
								</div>
								<div>
									<div>
										<p class="text-lg font-medium leading-6 text-white">
											Streamlined User Engagement
										</p>
									</div>
									<div class="mt-2 text-base text-gray-500">
										The NurseBulletin platform is designed for straightforward navigation and interaction.
										With clear categories for discussions, an easy-to-use review system, and a simple
										search function, new users can quickly become active members of our nursing community,
										sharing and gaining valuable insights.
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>



		</main>
	</section>
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
			<p class="text-sm text-gray-500 dark:text-gray-300">� Copyright 2024. All Rights Reserved.</p>

			<div class="flex -mx-2">
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