<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix= "fmt" uri= "http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isErrorPage="true" %>
  
<!DOCTYPE html>
<html >
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
	<main >
		<section class="bg-white dark:bg-gray-900">
			<div class="container flex flex-col items-center justify-center min-h-screen px-6 mx-auto py-12">
				<div class="w-full max-w-md p-10 rounded-md">
					<div class="flex justify-center mx-auto whitespace-nowrap">
						<a class=" px-3 py-2 text-white text-2xl transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700" href="/">
							<img class="w-22 h-22 sm:h-8 " src="/assets/nursebulletin-transparent.png" alt="">
						</a>
					</div>
					<div class="flex items-center justify-center mt-6">
						<p class="w-1/2 pb-4 font-medium text-center text-violet-400 capitalize border-b dark:border-gray-400 dark:text-violet-500">
							Create Review
						</p>
					</div>
				</div>

				<form:form method="post" action="/review/new" modelAttribute="review" class="w-full max-w-md dark:bg-gray-800 p-10 rounded-md">

					<div class="relative flex flex-col text-left ">
						<div class="text-white">
							<form:label path="hospital">Hospitals</form:label>
						</div>
						<div>
							<form:input type="text" id="hospitalName" list="hospitalList" placeholder="Search for hospitals..." path="hospitalName"
							class="block w-full px-4 py-2 mt-2 text-gray-500 placeholder-gray-500 bg-white border rounded-lg dark:bg-gray-800 dark:border-gray-600 dark:placeholder-gray-400 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-opacity-40 focus:outline-none focus:ring focus:ring-blue-300"
							aria-label="hospitalName"
							/>
							<datalist id="hospitalList">
								<c:forEach items="${hospitals}" var="hospital">
									<option value="${hospital.hospitalName} - ${ hospital.city }, ${hospital.state}" data-id="${hospital.id}" data-hospital-name="${ hospital.hospitalName }"></option>
								</c:forEach>
							</datalist>
							<form:hidden path="hospital.id" id="hospitalId"/>
							<form:errors path="hospitalName" class="text-red-500"/>
						</div>
					</div>
					<div class="relative flex flex-col text-left mt-6">
						<div class="text-white">
							<form:label path="title">Review Title</form:label>
						</div>
						<div>
							<form:input type="text" path="title"
								class="block w-full px-4 py-2 mt-2 text-gray-500 placeholder-gray-500 bg-white border rounded-lg dark:bg-gray-800 dark:border-gray-600 dark:placeholder-gray-400 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-opacity-40 focus:outline-none focus:ring focus:ring-blue-300"
								placeholder="Give your review a title" aria-label="Title"
							/>
							<form:errors path="title" class="text-red-500" />
						</div>
					</div>
					<div class="relative flex flex-col text-left mt-6">
						<div class="text-white">
							<form:label path="unitWorkedAt">Unit</form:label>
						</div>
						<div>
							<form:input type="text" path="unitWorkedAt"
								class="block w-full px-4 py-2 mt-2 text-gray-500 placeholder-gray-800 bg-white border rounded-lg dark:bg-gray-800 dark:border-gray-600 dark:placeholder-gray-400 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-opacity-40 focus:outline-none focus:ring focus:ring-blue-300"
								placeholder="What unit did you work in?" aria-label="Unit"
							/>
							<form:errors path="unitWorkedAt" class="text-red-500"/>
						</div>
					</div>
					<div class="relative flex flex-col text-left mt-6">
						<div class="text-white">
							<form:label path="rating">Rating</form:label>
						</div>
						<div>
							<form:select
								path="rating"
								class="block w-full px-4 py-2 mt-2 text-gray-500 placeholder-gray-500 bg-white border rounded-lg dark:bg-gray-800 dark:border-gray-600 dark:placeholder-gray-400 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-opacity-40 focus:outline-none focus:ring focus:ring-blue-300"
							>
								<form:option value="" label="Select" disabled="true" selected="true" />
								<form:option value="5" />
								<form:option value="4" />
								<form:option value="3" />
								<form:option value="2" />
								<form:option value="1" />
							</form:select>
							<form:errors path="rating" class="text-red-500"/>
						</div>
					</div>
					<div>
						<div class="relative flex flex-col text-left text-white">
							<form:label path="patientRatio">Nurse to Patient Ratio</form:label>
						</div>
						<div class="text-white">
							<form:select
								path="patientRatio"
								 class="block w-full px-4 py-2 mt-2 text-gray-500 placeholder-gray-500 bg-white border rounded-lg dark:bg-gray-800 dark:border-gray-600 dark:placeholder-gray-400 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-opacity-40 focus:outline-none focus:ring focus:ring-blue-300"
							>
								<form:option value="" label="Select" disabled="true" selected="true" />
								<form:option value="1:1 - 1:2" />
								<form:option value="1:3 - 1:5" />
								<form:option value="1:6 - 1:8" />
								<form:option value="> 1:8" />
							</form:select>
							<form:errors path="patientRatio" class="text-red-500"/>
						</div>
					</div>
					<div class="relative flex flex-col text-left mt-6">
						<div class="text-white">
							<form:label path="chartingSystem">Charting system used</form:label>
						</div>
						<div>
							<form:input type="text" path="chartingSystem"
										class="block w-full px-4 py-2 mt-2 text-gray-500 placeholder-gray-700 bg-white border rounded-lg dark:bg-gray-800 dark:border-gray-600 dark:placeholder-gray-400 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-opacity-40 focus:outline-none focus:ring focus:ring-blue-300"
								placeholder="Which charting system does this hospital use?"
							/>
							<form:errors path="chartingSystem" class="text-red-500"/>
						</div>
					</div>
					<div class="relative flex flex-col text-left mt-6">
						<div class="text-white">
							<form:label path="wouldReturn">Would you return</form:label>
						</div>
						<div>
							<form:select path="wouldReturn"
										 class="block w-full px-4 py-2 mt-2 text-gray-500 placeholder-gray-500 bg-white border rounded-lg dark:bg-gray-800 dark:border-gray-600 dark:placeholder-gray-400 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-opacity-40 focus:outline-none focus:ring focus:ring-blue-300"
							>
								<form:option value="" label="Select" disabled="true" selected="true" />
								<form:option value="yes" />
								<form:option value="no" />
								<form:option value="maybe" />
							</form:select>
							<form:errors path="wouldReturn" class="text-red-500"/>
						</div>
					</div>
					<div class="relative flex flex-col text-left mt-6">
						<div class="text-white">
							<form:label path="managementRating">How would you rate management</form:label>
						</div>
						<div>
							<form:select path="managementRating"
										 class="block w-full px-4 py-2 mt-2 text-gray-500 placeholder-gray-500 bg-white border rounded-lg dark:bg-gray-800 dark:border-gray-600 dark:placeholder-gray-400 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-opacity-40 focus:outline-none focus:ring focus:ring-blue-300"
							>
								<form:option value="" label="Select" disabled="true" selected="true" />
								<form:option value="5" />
								<form:option value="4" />
								<form:option value="3" />
								<form:option value="2" />
								<form:option value="1" />
							</form:select>
							<form:errors path="managementRating" class="text-red-500"/>
						</div>
					</div>
					<div class="relative flex flex-col text-left mt-6">
						<div class="text-white">
							<form:label path="content">How was your experience</form:label>
						</div>
						<div>
							<form:textarea rows="5" path="content" id="reviewContent"
										   class="block w-full px-2 py-2 mt-2 text-gray-500 placeholder-gray-500 bg-white border rounded-lg dark:bg-gray-900 dark:border-gray-600 dark:placeholder-gray-400 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-opacity-40 focus:outline-none focus:ring focus:ring-blue-300"
							placeholder="Briefly describe your experience..."
							/>
							<div class="block px-2 mt-1">
								<span id="charCount">0</span><span>/ 500 characters</span>
							</div>
							<form:errors path="content" class="text-red-500"/>
						</div>
					</div>
					<form:hidden path="author" value=" ${ userId } " />
					<br>
					<div class="login-row">
						<input type="submit" value="Add review"
							   class="block md:mx-2 lg:mx-2 my-2 py-2 px-4 font-semibold rounded dark:dark:bg-violet-400 dark:dark:text-gray-900 duration-300 hover:cursor-pointer hover:bg-violet-300"
						/>
					</div>
				</form:form>
			</div>
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
				<p class="text-sm text-gray-500 dark:text-gray-300 ">� Copyright 2024. All Rights Reserved.</p>

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