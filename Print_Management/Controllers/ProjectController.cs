﻿using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PM.Application.ImplementService;
using PM.Application.InterfaceService;
using PM.Application.Payloads.RequestModels.ProjectRequests;
using PM.Application.Payloads.ResponseModels.DataProjects;
using PM.Application.Payloads.Responses;

namespace Print_Management.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProjectController : ControllerBase
    {
        private readonly IProjectService _projectService;
        private readonly IDesignService _designService;
        private readonly IPrintJobService _printJobService;
        private readonly IResourceManagementService _resourceManagementService;


        public ProjectController(IProjectService projectService, IDesignService designService, IPrintJobService printJobService
            , IResourceManagementService resourceManagementService)
        {
            _projectService = projectService;
            _designService = designService;
            _printJobService = printJobService;
            _resourceManagementService = resourceManagementService;

        }

        [HttpPost("CreateProject")]
        public async Task<IActionResult> CreateProject([FromBody] Request_CreateProject request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var response = await _projectService.CreateProjectAsync(request);

            if (response.Status == StatusCodes.Status201Created)
            {
                return CreatedAtAction(nameof(CreateProject), new { id = response.Data.Id }, response.Data);
            }

            return StatusCode(response.Status, response.Message);
        }

        [HttpGet("all-projects")]
        public async Task<IActionResult> GetAllProjects()
        {
            var result = await _projectService.GetAllProjectsAsync();
            if (result.Status != StatusCodes.Status200OK)
            {
                return StatusCode(result.Status, result.Message);
            }
            return Ok(result.Data);
        }

        [HttpPost("AddDesign")]
        public async Task<IActionResult> AddDesign([FromBody] Request_CreateDesign request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var response = await _designService.CreateDesignAsync(request);

            if (response.Status == StatusCodes.Status201Created)
            {
                return CreatedAtAction(nameof(AddDesign), new { id = response.Data.Id }, response.Data);
            }

            return StatusCode(response.Status, response.Message);
        }

        [HttpGet("all-designs")]
        public async Task<IActionResult> GetAllDesignsForAllProjects()
        {
            var response = await _designService.GetAllDesignsForAllProjectsAsync();

            if (response.Status == StatusCodes.Status401Unauthorized)
            {
                return Unauthorized(new { response.Message });
            }

            if (response.Status == StatusCodes.Status404NotFound)
            {
                return NotFound(new { response.Message });
            }

            if (response.Status == StatusCodes.Status500InternalServerError)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { response.Message });
            }

            return Ok(response.Data);
        }


        [HttpGet("all-designs-belong-to-project/{projectId}")]
        public async Task<IActionResult> GetAllDesigns(long projectId)
        {
            var response = await _designService.GetAllDesignAsync(projectId);

            if (response.Status == StatusCodes.Status401Unauthorized)
            {
                return Unauthorized(new { response.Message });
            }

            if (response.Status == StatusCodes.Status404NotFound)
            {
                return NotFound(new { response.Message });
            }

            if (response.Status == StatusCodes.Status500InternalServerError)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { response.Message });
            }

            return Ok(response.Data);
        }


        [HttpPost("ApproveDesign/{designId}")]
        public async Task<IActionResult> ApproveDesign(long designId)
        {
            var response = await _designService.ApproveDesignAsync(designId);

            if (response.Status == StatusCodes.Status200OK)
            {
                return Ok(response);
            }

            return StatusCode(response.Status, response.Message);
        }

        [HttpPost("RejectDesign/{designId}")]
        public async Task<IActionResult> RejectDesign(long designId)
        {
            var response = await _designService.RejectDesignAsync(designId);

            if (response.Status == StatusCodes.Status200OK)
            {
                return Ok(response);
            }

            return StatusCode(response.Status, response.Message);
        }

        [HttpPost("ConfirmDesign-for-printing")]
        public async Task<IActionResult> ConfirmDesignForPrintingAsync([FromBody] Request_CreatePrintJob request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var response = await _printJobService.ConfirmDesignForPrintingAsync(request);

            if (response.Status == StatusCodes.Status201Created)
            {
                return Ok(response.Data); 
            }

            return StatusCode(response.Status, response.Message);
        }

        [HttpPost("CreateResources")]
        public async Task<IActionResult> CreateResources([FromBody] Request_CreateResource request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var response = await _resourceManagementService.CreateResourceAsync(request);

            if (response.Status == StatusCodes.Status201Created)
            {
                return CreatedAtAction(nameof(CreateResources), new { id = response.Data.Id }, response.Data);
            }

            return StatusCode(response.Status, response.Message);
        }

        [HttpGet("get-all-resources")]
        public async Task<IActionResult> GetAllResources()
        {

            var result = await _resourceManagementService.GetAllResourcesAsync();

            if (result.Status == StatusCodes.Status200OK)
            {
                return Ok(result);
            }

            return StatusCode(result.Status, result);
        }

        [HttpPost("CreateResource-property")]
        public async Task<IActionResult> CreateResourceProperty([FromBody] Request_CreateResourceProperty request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var response = await _resourceManagementService.CreateResourcePropertyAsync(request);

            if (response.Status == StatusCodes.Status201Created)
            {
                return CreatedAtAction(nameof(CreateResourceProperty), new { id = response.Data.Id }, response.Data);
            }

            return StatusCode(response.Status, response.Message);
        }

        [HttpGet("GetAllResourceProperties")]
        public async Task<ActionResult<ResponseObject<List<DataResponseResourceProperty>>>> GetAllResourcePropertiesAsync()
        {
            try
            {
                var result = await _resourceManagementService.GetAllResourcePropertiesAsync();
                if (result.Status == StatusCodes.Status404NotFound)
                {
                    return NotFound(result);
                }

                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new ResponseObject<List<DataResponseResourceProperty>>
                {
                    Status = StatusCodes.Status500InternalServerError,
                    Message = ex.Message,
                    Data = null
                });
            }
        }

        [HttpPost("CreateResource-property-detail")]
        public async Task<IActionResult> CreateResourcePropertyDetail([FromBody] Request_CreateResourcePropertyDetail request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var response = await _resourceManagementService.CreateResourcePropertyDetailAsync(request);

            if (response.Status == StatusCodes.Status201Created)
            {
                return CreatedAtAction(nameof(CreateResourcePropertyDetail), new { id = response.Data.Id }, response.Data);
            }

            return StatusCode(response.Status, response.Message);
        }

        //[HttpPost("CreateResource-for-print-job")]
        //[Authorize]
        //public async Task<IActionResult> CreateResourceForPrintJob([FromBody] Request_CreateResourceForPrintJob request)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return BadRequest(ModelState);
        //    }

        //    var response = await _resourceManagementService.CreateResourceForPrintJobAsync(request);

        //    if (response.Status == StatusCodes.Status201Created)
        //    {
        //        return CreatedAtAction(nameof(CreateResourceForPrintJob), new { id = response.Data.Id }, response.Data);
        //    }

        //    return StatusCode(response.Status, response.Message);
        //}

        [HttpPost("UsingResource-for-print-job")]
        public async Task<IActionResult> UsingResourceForPrintJob([FromBody] Request_CreateResourceForPrintJob request)
        {
            var response = await _resourceManagementService.UsingResourceForPrintJob(request);

            if (response.Status == StatusCodes.Status202Accepted)
            {
                return Accepted(response.Data);
            }

            return StatusCode(response.Status, response.Message);
        }

        [HttpGet("print-jobs")]
        public async Task<IActionResult> GetAllPrintJobs()
        {
            var result = await _printJobService.GetAllPrintJobsAsync();

            if (result.Status != StatusCodes.Status200OK)
            {
                return StatusCode(result.Status, result.Message);
            }
            return Ok(result.Data);
        }

        [HttpPost("ConfirmFinishing-project")]
        public async Task<IActionResult> ConfirmFinishingProject(long printJobId, long projectId)
        {
            var result = await _projectService.ConfirmFinishingProjectAsync(printJobId, projectId);
            return StatusCode(result.Status, new { result.Message, result.Data });
        }
    }
}
