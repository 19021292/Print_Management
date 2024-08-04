using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PM.Application.ImplementService;
using PM.Application.InterfaceService;
using PM.Application.Payloads.RequestModels.ProjectRequests;

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

        [HttpPost("Create project")]
        [Authorize(Roles = "Employee")]
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

        [HttpPost("Add design")]
        [Authorize(Roles = "Designer")]
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

        [HttpPost("Approve design/{designId}")]
        [Authorize]
        public async Task<IActionResult> ApproveDesign(long designId)
        {
            var response = await _designService.ApproveDesignAsync(designId);

            if (response.Status == StatusCodes.Status200OK)
            {
                return Ok(response);
            }

            return StatusCode(response.Status, response.Message);
        }

        [HttpPost("Reject design/{designId}")]
        [Authorize]
        public async Task<IActionResult> RejectDesign(long designId)
        {
            var response = await _designService.RejectDesignAsync(designId);

            if (response.Status == StatusCodes.Status200OK)
            {
                return Ok(response);
            }

            return StatusCode(response.Status, response.Message);
        }

        [HttpPost("Confirm design-for-printing")]
        [Authorize]
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

        [HttpPost("Create resources")]
        [Authorize]
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

        [HttpPost("Create resource-property")]
        [Authorize]
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

        [HttpPost("Create resource-property-detail")]
        [Authorize]
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

        [HttpPost("Create Resource-for-print-job")]
        [Authorize]
        public async Task<IActionResult> CreateResourceForPrintJob([FromBody] Request_CreateResourceForPrintJob request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var response = await _resourceManagementService.CreateResourceForPrintJobAsync(request);

            if (response.Status == StatusCodes.Status201Created)
            {
                return CreatedAtAction(nameof(CreateResourceForPrintJob), new { id = response.Data.Id }, response.Data);
            }

            return StatusCode(response.Status, response.Message);
        }

        [HttpPost("Using resource-for-print-job")]
        [Authorize]
        public async Task<IActionResult> UsingResourceForPrintJob(long resourceForPrintJobId)
        {
            var response = await _resourceManagementService.UsingResourceForPrintJob(resourceForPrintJobId);

            if (response.Status == StatusCodes.Status202Accepted)
            {
                return Accepted(response.Data);
            }

            return StatusCode(response.Status, response.Message);
        }

        [HttpPost("Confirm finishing-project")]
        [Authorize]
        public async Task<IActionResult> ConfirmFinishingProject(long printJobId, long projectId)
        {
            var result = await _projectService.ConfirmFinishingProjectAsync(printJobId, projectId);
            return StatusCode(result.Status, new { result.Message, result.Data });
        }
    }
}
