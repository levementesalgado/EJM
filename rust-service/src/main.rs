use tonic::{transport::Server, Request, Response, Status};

pub mod ejm {
    tonic::include_proto!("ejm");
}

use ejm::prospeccao_service_server::{ProspeccaoService, ProspeccaoServiceServer};
use ejm::grafico_service_server::{GraficoService, GraficoServiceServer};
use ejm::*;

#[derive(Default)]
pub struct ProspeccaoServiceImpl;

#[tonic::async_trait]
impl ProspeccaoService for ProspeccaoServiceImpl {
    async fn analisar_documentos(
        &self,
        request: Request<AnalisarRequest>,
    ) -> Result<Response<AnalisarResponse>, Status> {
        let req = request.into_inner();
        
        // TODO: Implementar ML real
        let response = AnalisarResponse {
            tags: vec!["silvicultura".to_string(), "reflorestamento".to_string()],
            resumo: "Análise de documentos processada".to_string(),
            confianca: 0.85,
        };
        
        Ok(Response::new(response))
    }

    async fn rastrear_empresa(
        &self,
        request: Request<RastrearRequest>,
    ) -> Result<Response<RastrearResponse>, Status> {
        let req = request.into_inner();
        
        // TODO: Implementar rastreamento real
        let response = RastrearResponse {
            empresa_nome: req.empresa_nome,
            noticias: vec!["Empresa expande operações".to_string()],
            periodo_contrato: "2024-2025".to_string(),
            status: "ativo".to_string(),
        };
        
        Ok(Response::new(response))
    }

    async fn gerar_tags(
        &self,
        request: Request<TagsRequest>,
    ) -> Result<Response<TagsResponse>, Status> {
        let req = request.into_inner();
        
        // TODO: Implementar geração de tags real
        let response = TagsResponse {
            tags: vec!["agroindustria".to_string(), "mecanizacao".to_string()],
            scores: [
                ("agroindustria".to_string(), 0.9),
                ("mecanizacao".to_string(), 0.7),
            ].into(),
        };
        
        Ok(Response::new(response))
    }
}

#[derive(Default)]
pub struct GraficoServiceImpl;

#[tonic::async_trait]
impl GraficoService for GraficoServiceImpl {
    async fn gerar_dados_financeiros(
        &self,
        request: Request<DadosFinanceirosRequest>,
    ) -> Result<Response<DadosFinanceirosResponse>, Status> {
        let req = request.into_inner();
        
        // TODO: Buscar dados reais do PostgreSQL
        let response = DadosFinanceirosResponse {
            total_entradas: 50000.0,
            total_saidas: 30000.0,
            lucro: 20000.0,
            itens: vec![
                ItemFinanceiro {
                    descricao: "Projeto X".to_string(),
                    valor: 25000.0,
                    data: "2024-01-15".to_string(),
                },
            ],
        };
        
        Ok(Response::new(response))
    }

    async fn gerar_dados_projetos(
        &self,
        request: Request<DadosProjetosRequest>,
    ) -> Result<Response<DadosProjetosResponse>, Status> {
        let req = request.into_inner();
        
        // TODO: Buscar dados reais do PostgreSQL
        let response = DadosProjetosResponse {
            total_projetos: 15,
            projetos_ativos: 5,
            projetos_concluidos: 10,
            projetos: vec![
                ProjetoResumo {
                    id: 1,
                    titulo: "Consultoria Silvicultura".to_string(),
                    status: "concluido".to_string(),
                    valor: 15000.0,
                },
            ],
        };
        
        Ok(Response::new(response))
    }
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let addr = "[::1]:50051".parse()?;
    let prospeccao = ProspeccaoServiceImpl::default();
    let grafico = GraficoServiceImpl::default();

    Server::builder()
        .add_service(ProspeccaoServiceServer::new(prospeccao))
        .add_service(GraficoServiceServer::new(grafico))
        .serve(addr)
        .await?;

    Ok(())
}
