package test

import (
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformExampleComplete(t *testing.T) {
	t.Parallel()

	fixturesFile := "../examples/complete/fixtures.tfvars"
	randId := strings.ToLower(random.UniqueId())

	projectId := terraform.GetVariableAsStringFromVarFile(t, fixturesFile, "project_id")
	environment := terraform.GetVariableAsStringFromVarFile(t, fixturesFile, "environment")

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/complete",
		VarFiles:     []string{"fixtures.tfvars"},
		Vars: map[string]interface{}{
			"secret_id": randId,
		},
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	fullSecretId := terraform.Output(t, terraformOptions, "full_secret_id")
	expectedFullSecretId := "projects/" + projectId + "/secrets/" + environment + "_" + randId
	assert.Equal(t, expectedFullSecretId, fullSecretId)

	secretId := terraform.Output(t, terraformOptions, "secret_id")
	expectedSecretId := environment + "_" + randId
	assert.Equal(t, expectedSecretId, secretId)
}
